# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOME/.env.sh

export VISUAL=nvim
export EDITOR=nvim

export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin:$DOTFILES/scripts/"

if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

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

# llvm
export PATH=/opt/homebrew/opt/llvm/bin:$PATH

# golang
export PATH=$HOME/go/bin:$PATH

# bun completions
[ -s "/Users/dodi/.bun/_bun" ] && source "/Users/dodi/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"

export PATH="$PATH:$HOME/Documents/intek/bin"

# opam configuration
[[ ! -r /Users/dodi/.opam/opam-init/init.zsh ]] || source /Users/dodi/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gvm="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^y' autosuggest-accept
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey -s '^f' "tmux_sessionizer\n"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias pn=pnpm
alias love="/Applications/love.app/Contents/MacOS/love"
alias gu="gitui"
alias gf="git fetch"
alias gs="git status"
alias gvim="nvim --listen 127.0.0.1:55432"
alias b="cd .."
alias c=clear
alias ls=eza
alias lt="eza --tree --long"
alias ll="eza --long"
alias v=nvim
alias n=nvim
alias cat=bat

# Switch branch with fuzzy finder
alias gl="git log --all --decorate --graph --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias lg="lazygit"

take() {
    mkdir -p $1
    cd $1
}

# tmux
tma() {
    tmux attach -t $1
}

tmn() {
    tmux new -s $1
}

# colors
DARK_COLOR="kanagawa-dragon.yaml"
LIGHT_COLOR="rose-pine-dawn.yaml"

day() {
    export NEOVIM_BACKGROUND="light"
    alacritty-colorscheme -V apply $LIGHT_COLOR
    dark-mode off
}

night() {
    export NEOVIM_BACKGROUND="dark"
    alacritty-colorscheme -V apply $DARK_COLOR
    dark-mode on
}
alias nigth="night"

# Initialize neovim background flag
if hash is_dark_mode 2>/dev/null && is_dark_mode; then
    export NEOVIM_BACKGROUND="dark"
else
    export NEOVIM_BACKGROUND="light"
fi

# AWS config
export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=sdk-dev-devops
export PASSPHRASE=Intekplus

# Cardano
export MAINNET0=addr1q9ydcxyv673l5fz5nq2y54rfcd82z8z5ja2cw55jd9psq94zhxgwp3qqym57jwq6hkcch205h7qt6e0hcxfxxdtlvjts2l2udl
export MAINNET1=addr1q957m0ws6zjl6l07pl8dqa3s6q7zl857tsxdypc4zem5edskgv552vsywzgqyukhupc8qckzr4g2wqsmxl0tsssn4wrqt85etp
export PREPROD0=addr_test1qpydcxyv673l5fz5nq2y54rfcd82z8z5ja2cw55jd9psq94zhxgwp3qqym57jwq6hkcch205h7qt6e0hcxfxxdtlvjtsffhupq
export PREPROD1=addr_test1qp57m0ws6zjl6l07pl8dqa3s6q7zl857tsxdypc4zem5edskgv552vsywzgqyukhupc8qckzr4g2wqsmxl0tsssn4wrqg3fe87

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias f)

# pnpm
export PNPM_HOME="/Users/dodi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "/Users/dodi/.deno/env"

export PATH="/Users/dodi/.deno/bin:$PATH"
fpath=($fpath "/Users/dodi/.local/share/zsh-completions/site-functions/")

export PATH="$HOME/.aiken/bin:$PATH"

# Added by Windsurf
export PATH="/Users/dodi/.codeium/windsurf/bin:$PATH"
