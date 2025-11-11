export PATH="${HOME}/.pyenv/shims:$PATH"

if command -v jenv >/dev/null 2>&1; then
  : "${JENV_ROOT:=$HOME/.jenv}"
  case ":$PATH:" in *":$JENV_ROOT/bin:"*) ;; *) PATH="$JENV_ROOT/bin:$PATH";; esac
  eval "$(jenv init -)"
fi

if [[ $(uname -m) == 'arm64' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH=$PATH:$M2_HOME/bin
export PATH=$GRADLE_HOME/bin:$PATH
export PATH="/opt/homebrew/opt/gcc/bin:$PATH"
export PATH="$HOME/code/Odin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/Applications/WebStorm.app/Contents/MacOS:$PATH"

