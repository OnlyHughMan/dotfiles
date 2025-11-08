export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ANDROID_HOME=$HOME/Library/Android/sdk
export M2_HOME=/opt/homebrew/opt/maven
export MAVEN_HOME=/opt/homebrew/opt/maven
export GRADLE_HOME=/usr/local/gradle/gradle-8.10.2
export OBSIDIAN_PATH="Documents/Obsidian\ Vault"
export NODE_EXTRA_CA_CERTS=~/.mitmproxy/mitmproxy-ca-cert.pem

set -o noclobber
export GPG_TTY=$(tty)
