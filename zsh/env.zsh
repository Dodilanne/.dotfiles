[[ -r "$HOME/.env.sh" ]] && source "$HOME/.env.sh"

export VISUAL=nvim
export EDITOR=nvim

export OPENCODE_EXPERIMENTAL_MARKDOWN=false
export OTEL_SDK_DISABLED="true"

export PYENV_ROOT="$HOME/.pyenv"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/Library/pnpm"
export GOPATH="$HOME/go"
export GOROOT="$HOME/.go"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK="$ANDROID_HOME"

export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=sdk-prod-devops

if [[ -n "$NVIM_SHELL_ALIASES" ]]; then
  unset NVIM_SHELL_ALIASES
  source "$DOTFILES/zsh/aliases.zsh"
fi
