# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "romkatv/powerlevel10k"
plug "jeffreytse/zsh-vi-mode"


# Title
case "$TERM" in
    xterm*|rxvt*)
        function xtitle () {
            builtin print -n -- "\e]0;$@\a"
        }
        ;;
    screen)
        function xtitle () {
            builtin print -n -- "\ek$@\e\\"
        }
        ;;
    *)
        function xtitle () {
        }
esac
function precmd () {
    xtitle "$(print -P '%~')"
}
 function preexec () {
    xtitle "$1"
}

# History
export HISTFILE=~/.cache/zsh/zsh_history
export SAVEHIST=100000
export HISTFILESIZE=100000
export HISTSIZE=100000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
export HISTTIMEFORMAT="[%F %T] "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Aliases
alias sudo='sudo '
alias ls='lsd --group-directories-first'
alias cat='bat -p'
alias ip='ip --color=auto'
alias vim='/usr/bin/nvim'
alias vi='/usr/bin/nvim'
alias tovenv='source venv/bin/activate'
alias fp='fping -gaq'
alias turn_off_left_mon='xrandr --output DisplayPort-1 --off'
alias restore_monitors='xrandr --output DisplayPort-2 --mode 1920x1080 --rate 165 --primary --output DisplayPort-1 --mode 1920x1080 --rate 165 --left-of DisplayPort-2'
alias dotfiles='/usr/bin/git --git-dir="$HOME/Git/dotfiles/" --work-tree="$HOME"'
# Exports
export PATH=$HOME/.local/bin:$PATH
export GOMODCACHE='/home/welqd/.config/go/pkg/mod'
export GOPATH='/home/welqd/.config/go'
export TASKDDATA=/var/lib/taskd 
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
# Home cleanup
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export TS3_CONFIG_DIR="$XDG_CONFIG_HOME/ts3client"
export W3M_DIR="$XDG_DATA_HOME/w3m"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
