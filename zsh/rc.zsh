source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh

if type "direnv" > /dev/null; then
    eval "$(direnv hook zsh)"
fi

if type "thefuck" > /dev/null; then
    eval "$(thefuck --alias)"
fi

function zvm_after_init() {
    source $DOTFILES/zsh/aliases.zsh
}

function zvm_config() {
    # Disable the cursor style feature
    ZVM_CURSOR_STYLE_ENABLED=false
}

export VISUAL=nvim
export EDITOR=nvim

export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin:$DOTFILES/scripts/"

if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

export NVM_DIR="/Users/dodi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DOTNET_ROOT=/usr/local/share/dotnet/x64
export PATH=$PATH:$DOTNET_ROOT

export MONO_BIN=/Library/Frameworks/Mono.framework/Versions/6.12.0/bin
export PATH=$PATH:$MONO_BIN

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/dodi/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK/platform-tools:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="/Users/dodi/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# llvm
export PATH=/opt/homebrew/opt/llvm/bin:$PATH

# golang
export PATH=$HOME/go/bin:$PATH

# bun completions
[ -s "/Users/dodi/.bun/_bun" ] && source "/Users/dodi/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH=$PATH:/Users/dodi/.spicetify

# AWS config
export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=sdk-dev-developer
export PASSPHRASE=Intekplus

eval "$(lua ~/scripts/z.lua/z.lua --init zsh enhanced once fzf)"

export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"

eval "$(starship init zsh)"

source_if_exists $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source_if_exists $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source_if_exists $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /Users/dodi/.config/broot/launcher/bash/br

export PATH="$PATH:/Users/dodi/.aiken/bin"

# opam configuration
[[ ! -r /Users/dodi/.opam/opam-init/init.zsh ]] || source /Users/dodi/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
# ---- END FZF -----

PATH=~/.console-ninja/.bin:$PATH

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gvm="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
