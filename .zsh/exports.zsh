export NVM_DIR="$HOME/.nvm"

nvm_lazy_load() {
  unset -f nvm node npm npx nvm_lazy_load
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

nvm()  { nvm_lazy_load; nvm  "$@"; }
node() { nvm_lazy_load; node "$@"; }
npm()  { nvm_lazy_load; npm  "$@"; }
npx()  { nvm_lazy_load; npx  "$@"; }

export ANDROID_HOME=$HOME/Library/Android/sdk
export M2_HOME=/opt/homebrew/opt/maven
export MAVEN_HOME=/opt/homebrew/opt/maven
export GRADLE_HOME=/usr/local/gradle/gradle-8.10.2
export OBSIDIAN_PATH="Documents/Obsidian\ Vault"
#export NODE_EXTRA_CA_CERTS=~/.mitmproxy/mitmproxy-ca-cert.pem

set -o noclobber
export GPG_TTY=$(tty)
