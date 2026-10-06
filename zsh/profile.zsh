typeset -U path PATH

if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

path=(
  $HOME/.opencode/bin
  $HOME/flutter/flutter/bin
  $HOME/.codeium/windsurf/bin
  $HOME/.aiken/bin
  $HOME/.deno/bin
  $PNPM_HOME
  $GOPATH/bin
  /opt/homebrew/opt/icu4c/sbin
  /opt/homebrew/opt/icu4c/bin
  $BUN_INSTALL/bin
  /opt/homebrew/opt/llvm/bin
  $ANDROID_HOME/platform-tools
  $PYENV_ROOT/shims
  $PYENV_ROOT/bin
  $HOME/.cargo/bin
  $path
  /usr/local/sbin
  $DOTFILES/bin
  $HOME/.local/bin
  $DOTFILES/scripts
  $HOME/Documents/intek/bin
  $HOME/Documents/personal/printx
  $ANDROID_HOME/emulator
  $HOME/.pub-cache/bin
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
)
export PATH
