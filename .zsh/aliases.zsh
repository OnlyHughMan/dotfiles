# use df when in home dir
if [ "$PWD" = "$HOME" ]; then
  alias git='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi
# Git
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gp='git push'
alias gl='git pull -r'
alias gst='git status'
alias gd='git diff'
alias glog='git log'

# Yarn
alias yt='yarn test'
alias yb='yarn build'
alias yut='yarn unittest'
alias ys='yarn start'

# NPM
alias nrt='npm run test'
alias nrb='npm run build'

# Docker / K8s
alias dcd='docker-compose down'
alias dcu='docker-compose up'
alias k='kubectl'
alias rm_containers='docker rm -vf $(docker ps -aq)'
alias rm_images='rm_containers && docker rmi -f $(docker images -aq)'

# Misc
alias zed="open -a /Applications/Zed.app -n"
alias stc="say finished"
alias ij="/usr/local/bin/idea ."
alias ws="/usr/local/bin/idea ."
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dft='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status'
alias runcpp='function _runcpp(){ g++ -Wall "$1" -o "${1%.cpp}" && ./"${1%.cpp}" < "$2"; }; _runcpp'
alias init.lua='~/.config/nvim/init.lua'
alias unb64="pbpaste | base64 --decode"
