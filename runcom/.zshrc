for DOTFILE in ".dotfiles/system/.env"; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -e

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# ZSH
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="gentoo"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

plugins=(git dotenv gradle stack)
source $ZSH/oh-my-zsh.sh
export PATH=~/.local/bin:$PATH
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

