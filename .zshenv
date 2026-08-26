# Make nvm's default node available in non-interactive shells (e.g. Claude Code)
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR/versions/node" ]; then
  _nvm_default=$(cat "$NVM_DIR/alias/default" 2>/dev/null)
  # Dirs are named v<version>; the alias may be "24", "24.19.0" or "v24.19.0".
  _nvm_version=$(ls "$NVM_DIR/versions/node/" 2>/dev/null | grep "^v${_nvm_default#v}" | sort -V | tail -1)
  # The alias can point at another alias (lts/*), which won't match — take newest.
  [ -z "$_nvm_version" ] && _nvm_version=$(ls "$NVM_DIR/versions/node/" 2>/dev/null | sort -V | tail -1)
  [ -n "$_nvm_version" ] && export PATH="$NVM_DIR/versions/node/$_nvm_version/bin:$PATH"
  unset _nvm_default _nvm_version
fi
