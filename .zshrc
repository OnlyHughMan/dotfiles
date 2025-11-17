#zmodload zsh/zprof
# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Extras
eval "$(zoxide init zsh)"
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source modular config
source ~/.zsh/exports.zsh
source ~/.zsh/paths.zsh
source ~/.zsh/aliases.zsh

for file in ~/.zsh/functions/*.zsh; do
  source "$file"
done

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bindkey -v

for f in "$HOME"/.zsh/*.zsh "$HOME"/.zsh/**/*.zsh; do
  [ -r "$f" ] && source "$f"
done

export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(atuin init zsh --disable-up-arrow)"
#zprof
