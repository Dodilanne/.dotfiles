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

bindkey '^R' history-incremental-search-backward
bindkey '^y' autosuggest-accept

bindkey -s '^f' "tmux_sessionizer\n"

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
DARK_COLOR="lackluster.yaml"
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
