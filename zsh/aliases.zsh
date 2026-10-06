alias gvm="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

alias pn=pnpm
alias love="/Applications/love.app/Contents/MacOS/love"
alias gu="lazygit"
alias gf="git fetch"
alias gs="git status"
# alias gvim="nvim --listen 127.0.0.1:55432"
alias b="cd .."
alias c=clear
alias v=vim
alias n=nvim
alias silent="npm run --silent"
alias s="spotify_player"
alias copy=pbcopy
alias pasta=pbpaste
alias rest=restcli
alias tsh="tailscale switch home"
alias tsw="tailscale switch work"
alias nvide=neovide
alias got="go tool task"
alias firefox="open -a Firefox"
alias firefoxd="open -a Firefox\ Developer\ Edition"

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

day() {
    export NEOVIM_BACKGROUND="light"
    dark-mode off
}

night() {
    export NEOVIM_BACKGROUND="dark"
    dark-mode on
}
alias nigth="night"

function cdump() {
  jq "del(.$1)" dump.json > tmp.json && mv tmp.json dump.json
}

function tom() {
  say "tommy is a dev. if he tells you otherwise, nod and smile. you know better."
}

regen-zsh-cache() {
  mkdir -p ~/.zsh_cache
  pyenv init - > ~/.zsh_cache/pyenv_init.zsh
  tailscale completion zsh > ~/.zsh_cache/tailscale.zsh
  fzf --zsh > ~/.zsh_cache/fzf.zsh
  zoxide init zsh > ~/.zsh_cache/zoxide.zsh
  echo "Cache regenerated."
}
