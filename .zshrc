# If you come from bash you might have to change your $PATH.G
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Set 
export ZOXIDE_CMD_OVERRIDE=cd 
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false
export XDG_CONFIG_HOME=$HOME/.config/
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

# Initialize some programs
eval "$(oh-my-posh init zsh --config $HOME/.ohmyposh/themes/negligible.omp.json)"
eval "$(thefuck --alias)"

plugins=(
  git 
  aliases 
  colorize
  rsync
  ssh-agent
  tmux
  tmuxinator
  archlinux
  zoxide
  colored-man-pages
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Load custom aliases
for file in ~/.dotfiles/aliases/*; do
    if [[ -f $file && -r $file && $file != *.swp ]]; then
        source "$file"
    fi
done

if type clipcat-menu >/dev/null 2>&1; then
    alias clipedit=' clipcat-menu --finder=builtin edit'
    alias clipdel=' clipcat-menu --finder=builtin remove'

    bindkey -s '^\' "^Q clipcat-menu --finder=builtin insert ^J"
    bindkey -s '^]' "^Q clipcat-menu --finder=builtin remove ^J"
fi

eval "$(atuin init zsh)"

# Uncomment for a fun welcome to a new terminal
# fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1)
