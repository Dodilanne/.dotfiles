alias pn=pnpm
alias love="/Applications/love.app/Contents/MacOS/love"
alias gu="gitui"
alias gvim="nvim --listen 127.0.0.1:55432 ."
alias b="cd .."
alias c=clear
alias ls=exa
alias lt="exa --tree --long"
alias ll="exa --long"
alias v=vim
alias n=nvim
alias cat=bat 

bindkey '^R' history-incremental-search-backward

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
DARK_COLOR="base16-rose-pine.yml"
LIGHT_COLOR="base16-rose-pine-dawn.yml"

day() {
  export NEOVIM_BACKGROUND="light"
  alacritty-colorscheme -V apply $LIGHT_COLOR
  dark-mode off
  spicetify config color_scheme rose-pine-dawn
  spicetify apply -y
}

night() {
  export NEOVIM_BACKGROUND="dark"
  alacritty-colorscheme -V apply $DARK_COLOR
  dark-mode on
  spicetify config color_scheme rose-pine
  spicetify apply -y
}

# Initialize neovim background flag
if hash is_dark_mode 2>/dev/null && is_dark_mode; then
  export NEOVIM_BACKGROUND="dark"
else
  export NEOVIM_BACKGROUND="light"
fi

