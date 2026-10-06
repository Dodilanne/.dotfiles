if [ -n "$GHOSTTY_RESOURCES_DIR" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

if [ -n "${ZSH_DEBUGRC+1}" ]; then
  zmodload zsh/zprof
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz compinit
compinit -C -u

ZINIT[COMPINIT_OPTS]="-C"

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit ice wait lucid; zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait lucid atload'!_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid; zinit light Aloxaf/fzf-tab
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fpath=($fpath "$HOME/.local/share/zsh-completions/site-functions/")

source ~/.zsh_cache/pyenv_init.zsh

eval "$(fnm env --use-on-cd --shell zsh)" > /dev/null 2>&1

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

source "$DOTFILES/zsh/aliases.zsh"

# Initialize neovim background flag
if hash is_dark_mode 2>/dev/null && is_dark_mode; then
    export NEOVIM_BACKGROUND="dark"
else
    export NEOVIM_BACKGROUND="light"
fi

export PASSPHRASE=Intekplus

# Cardano
export MAINNET0=addr1q9ydcxyv673l5fz5nq2y54rfcd82z8z5ja2cw55jd9psq94zhxgwp3qqym57jwq6hkcch205h7qt6e0hcxfxxdtlvjts2l2udl
export MAINNET1=addr1q957m0ws6zjl6l07pl8dqa3s6q7zl857tsxdypc4zem5edskgv552vsywzgqyukhupc8qckzr4g2wqsmxl0tsssn4wrqt85etp
export PREPROD0=addr_test1qpydcxyv673l5fz5nq2y54rfcd82z8z5ja2cw55jd9psq94zhxgwp3qqym57jwq6hkcch205h7qt6e0hcxfxxdtlvjtsffhupq
export PREPROD1=addr_test1qp57m0ws6zjl6l07pl8dqa3s6q7zl857tsxdypc4zem5edskgv552vsywzgqyukhupc8qckzr4g2wqsmxl0tsssn4wrqg3fe87
export PREPROD2=addr_test1qzguq54zavjapmvma4p4mrw2sclammft2g09apnhyvde4yavezyp6rwd8fnd74tex9hyj2uf90k2mrkmppauylz9t8aq029kvz
export PREPROD3=addr_test1qphvqdvl3hsgq6v50g7prqlmpddcpupxdmyvw4ppmwrt29g06np8v2zsx3azpes0uss3ygmayg3awuc2cnufvdhanq4spae94l
export PREPROD4=addr_test1qz9qyd6ma9jklzpzj2zjv5genn2n48uvaxmf3fn49kkxmu2neyfp676xegpp3sv2fww9fzrx0muxn5jsc046765smqrqmv5jhs
export PREPROD5=addr_test1qra3g6axm4cjnkc9qclcqmvtdwtxyllca98xg2wy9cvakm3xtetvd2ptzlel9lvhwlqcrx4ddlhg2hwxe3czmn9myflqczkule
export PREPROD6=addr_test1qz8x83cz9yywvurtqyk4aq3kh64ums4advld7hdl02etmppha6uk4kxkcnpg9hrm50cpp3k4lwga2jcaq9ucn5nactkql5u2hp
export PREPROD7=addr_test1qz29ejac686qpq9rd58jkq85qktl6fw2eyrqmeesets5z6zda04jen0h2qlydkl76emnanv2t6l05aesup8l53svuj3s75ukr3
export PREPROD8=addr_test1qrcfwfj5tlc7us2sp88y23uad9hsav4gh8y96lpmxkp6sgp9aqts2mktv7npgdpu4gmaynyvax42n52czk8jgvcnjnrq5nfq7n
export PREPROD9=addr_test1qqckuy27zzr3xn9my78kn9g6k0qzakq4mxwq42wcx7cryaktg6cax6s4damxeqxgphezv85q93yvaklwnx6p882xrd0s3zwp76
export PREPRODOTHER0=addr_test1qzdal7h03fx9u5mq0ud59smtq0785pl664u3sf6zu2u43wzh6l8l4vwa4as57mm5gf0a3epxfmgh255tqqk3nhultuwsny6jpz
export MAINNET_ANVIL=addr1q8seyqha6kdmv9l8xxneek9zahghsmksnxu6lrmwwzh9dg8zrhhjr476dsq2fgmety6j3adv9t3wcycv0jp4ajr3z8tqvnajjn
export MAINNET_TQUERI=addr1q9qur503rgx3duk9k5law0z09d9gq3mgt948cgmx8cv77ymlfwslu37u86tjlrljy9w60cf2c3dgh7pplmzg7f8zd35s9m3r5u
export PABZ_VAULT=addr_test1qphd08gg02s6kqcfttxkgrjkn8mvpq24uz4zynft3l8j6vfn06pkwzamcg5w8sn3rzl39kr9ql953kcvdm4u7x4pqz3q6dcfpk

source ~/.zsh_cache/fzf.zsh
source ~/.zsh_cache/zoxide.zsh
source ~/.zsh_cache/tailscale.zsh

reset_cursor_shape_and_color() {
  print -n '\e[2 q\e]112\a'
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd reset_cursor_shape_and_color

if [ -n "${ZSH_DEBUGRC+1}" ]; then
  zprof
fi

