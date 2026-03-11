. "$HOME/.cargo/env"

# Make nvm's default node available in non-interactive shells (e.g. Claude Code)
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR/versions/node" ]; then
  _nvm_default=$(cat "$NVM_DIR/alias/default" 2>/dev/null)
  _nvm_version=$(ls "$NVM_DIR/versions/node/" 2>/dev/null | grep "^${_nvm_default%.*}" | sort -V | tail -1)
  [ -n "$_nvm_version" ] && export PATH="$NVM_DIR/versions/node/$_nvm_version/bin:$PATH"
  unset _nvm_default _nvm_version
fi
