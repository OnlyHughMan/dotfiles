#!/usr/bin/env bash

set -euo pipefail

# -------- Config (override via env) --------
DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/OnlyHughMan/dotfiles.git}"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
WORK_TREE="${WORK_TREE:-$HOME}"
BREWFILE_PATH="${BREWFILE_PATH:-}"          # leave empty to auto-detect
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d%H%M%S)"

echo ''

# -------- Pretty logging (kept from your style) --------
info ()    { printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"; }
user ()    { printf "\r  [ \033[0;33m??\033[0m ] %s\n" "$1"; }
success () { printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"; }
fail ()    { printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n\n" "$1"; exit 1; }

is_macos() { [[ "$(uname -s)" == "Darwin" ]]; }

DOTGIT() { git --git-dir="$DOTFILES_DIR" --work-tree="$WORK_TREE" "$@"; }

# -------- Ensure git (macOS gets it from Xcode CLT) --------
if ! command -v git >/dev/null 2>&1; then
  if is_macos; then
    info "Installing Xcode Command Line Tools for git..."
    xcode-select --install || true
    until xcode-select -p >/dev/null 2>&1; do sleep 5; done
    success "Xcode CLT installed."
  else
    fail "git is required. Please install git and re-run."
  fi
fi

# -------- Clone or update bare repo --------
if [[ -d "$DOTFILES_DIR" ]]; then
  info "Found existing bare repo at $DOTFILES_DIR; fetching updates..."
  DOTGIT fetch --all --prune || true
  DOTGIT config status.showUntrackedFiles no || true
else
  info "Cloning bare repo to $DOTFILES_DIR"
  git clone --bare "$DOTFILES_REPO" "$DOTFILES_DIR"
  DOTGIT config status.showUntrackedFiles no
fi
success "Repo ready."

# -------- Checkout into $HOME with conflict backup --------
info "Checking out dotfiles into $WORK_TREE"
if ! DOTGIT checkout; then
  info "Conflicts detected; backing up to $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"
  DOTGIT checkout 2>&1 | awk '/\t/ {print $1}' | while read -r path; do
    mkdir -p "$BACKUP_DIR/$(dirname "$path")"
    mv "$WORK_TREE/$path" "$BACKUP_DIR/$path" 2>/dev/null || true
  done
  DOTGIT checkout
fi
success "Dotfiles checked out."

# -------- Add persistent alias to shell rc (exact match, idempotent) --------
add_alias_if_missing() {
  local rc="$1"
  local line="alias dotgit='git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'"
  [[ -f "$rc" ]] || return 0
  if ! grep -qxF "$line" "$rc" 2>/dev/null; then
    printf "\n# dotfiles bare-repo helper\n%s\n" "$line" >> "$rc"
    success "Added dotgit alias to $rc"
  else
    info "dotgit alias already present in $rc"
  fi
}
add_alias_if_missing "$HOME/.zshrc"

# Also make it available in THIS shell
alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# -------- Optional: ensure ~/.zsh/*.zsh gets sourced (once) --------
if [[ -f "$HOME/.zshrc" ]] && ! grep -q "### DOTFILES_ZSH_LOAD_BEGIN ###" "$HOME/.zshrc" 2>/dev/null; then
  cat >> "$HOME/.zshrc" <<'EOF'

### DOTFILES_ZSH_LOAD_BEGIN ###
for f in "$HOME"/.zsh/*.zsh "$HOME"/.zsh/**/*.zsh; do
  [ -r "$f" ] && source "$f"
done
### DOTFILES_ZSH_LOAD_END ###
EOF
  success "Added ~/.zsh/**/*.zsh sourcing loop to ~/.zshrc"
fi

# -------- Homebrew + Brewfile (idempotent) --------
if is_macos; then
  info "Ensuring Homebrew"
  if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ -d /opt/homebrew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
      grep -qF 'eval "$(/opt/homebrew/bin/brew shellenv)"' "$HOME/.zprofile" 2>/dev/null || \
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    else
      eval "$(/usr/local/bin/brew shellenv)"
      grep -qF 'eval "$(/usr/local/bin/brew shellenv)"' "$HOME/.zprofile" 2>/dev/null || \
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
    fi
  fi
  success "Homebrew ready"

  # Pick Brewfile: explicit > ~/.Brewfile > ~/Brewfile (tracked via bare repo)
  if [[ -z "$BREWFILE_PATH" ]]; then
    if   [[ -f "$HOME/.Brewfile" ]]; then BREWFILE_PATH="$HOME/.Brewfile"
    elif [[ -f "$HOME/Brewfile"  ]]; then BREWFILE_PATH="$HOME/Brewfile"
    fi
  fi

  if [[ -n "$BREWFILE_PATH" && -f "$BREWFILE_PATH" ]]; then
    info "Installing dependencies via brew bundle ($BREWFILE_PATH)"
    brew bundle --file="$BREWFILE_PATH"
    brew autoremove || true
    brew cleanup || true
    success "Dependencies installed"
  else
    info "No Brewfile found (set BREWFILE_PATH or create ~/.Brewfile). Skipping brew bundle."
  fi
fi

echo ''
echo '  All installed!'
