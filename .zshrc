#zmodload zsh/zprof
# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
# Theme and autosuggestions come from brew, not oh-my-zsh's custom dirs, so they
# are sourced directly below. Leaving them in ZSH_THEME/plugins makes oh-my-zsh
# search ~/.oh-my-zsh/custom and warn that it can't find them.
ZSH_THEME=""
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# Must load before ~/.p10k.zsh, which configures it
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Extras
eval "$(zoxide init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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

export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#zprof
