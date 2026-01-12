export GPG_TTY=$(tty)
# Git
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gp='git push'
alias gl='git pull -r'
alias gst='git status'
alias gd='git diff'
alias glog='git log'
alias gupd="git add .; git commit -m 'quick update'"

# dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot_update='dotgit add -u; dotgit commit -m "dotfiles update"'
du() {
  local msg="${1:-dotfiles update}"
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add -u && \
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "$msg"
}
alias dg='dotgit'
alias dp='dotgit push'
alias ds='dotgit status'

# Yarn
alias yt='yarn test'
alias yb='yarn build'
alias yut='yarn unittest'
alias ys='yarn start'

# NPM
alias nrt='npm run test'
alias nrb='npm run build'

# Docker / K8s
alias dcd='docker compose down'
alias dcu='docker compose up'
alias k='kubectl'
alias rm_containers='docker rm -vf $(docker ps -aq)'
alias rm_images='rm_containers && docker rmi -f $(docker images -aq)'

# Misc
alias zed="open -a /Applications/Zed.app -n"
alias stc="say finished"
alias ij="/usr/local/bin/idea ."
alias runcpp='function _runcpp(){ g++ -Wall "$1" -o "${1%.cpp}" && ./"${1%.cpp}" < "$2"; }; _runcpp'
alias init.lua='~/.config/nvim/init.lua'
alias unb64="pbpaste | base64 --decode"
alias sts='aws sts get-caller-identity --no-cli-pager'
alias -g -- ~~='2>&1 | less'
alias ksec="kubectl get secrets -o json | jq '.items[] | {name: .metadata.name,data: .data|map_values(@base64d)}'"

# Tmux
alias ta='tmux attach'
alias tls='tmux ls'

# lcp
alias next='lcp practice'
