git clone --bare https://github.com/OnlyHughMan/dotfiles.git "$HOME/.dotfiles"
alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotgit config status.showUntrackedFiles no
dotgit checkout
chmod +x ~/.bootstrap_dotfiles.sh
