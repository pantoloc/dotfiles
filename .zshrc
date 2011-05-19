# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored 
zstyle ':completion:*' completions 1
zstyle ':completion:*' format '0 %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/veel/.zshrc'



autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd
unsetopt beep
bindkey -e
source /etc/profile

#PROMPT='%d%>:%{\e[0m%}'
#PROMPT=$'%{\e[0;35m%}%B┌─[%b%{\e[0;34m%}%n%{\e[0m%}@%{\e[0;34m%}%m%{\e[0;35m%}%B]%b%{\e[1;35m%}[%b%{\e[0;34m%}%~%{\e[0;35m%}%B]
#%{\e[0;35m%}%B└─╼%b%{\e[1;30m%}%{\e[0m%} '

#PROMPT=$'%{\e[0;33m%}%B[%b%{\e[0;32m%}%n%{\e[0;33m%}%B][%{\e[0;32m%}%~%{\e[0;33m%}%B]%{\e[0m%} ' 

PROMPT=$'%{\e[0;33m%}%B[%{\e[0;32m%}%~%{\e[0;33m%}%B]%{\e[0m%} ' 

alias c='cdls.sh'
alias I='sudo pacman -S'
alias e='emacsclient -c'
alias ee='emacsclient -t'
alias es='sudo emacs -nw'
alias mvt='mv ~/dl/*.torrent ~/torrents/active'
alias m="mplayer"
alias df="df -h"
alias shutup="sudo shutdown -h now"
alias feh="feh -."
alias du="du -h"
alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov,mkv}='mplayer'
alias -s {png,jpg,jpeg,gif}='feh'
alias -s {html,php,com,net}='conkeror'
alias -s {pdf}='xpdf'
alias scrot="scrot -c -d 5"
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias I="sudo pacman -S"
alias R="sudo pacman -Rs"
alias U="sudo pacman -Syu"
alias svi='sudo vi'
alias scp='sudo cp'
alias smv='sudo mv'
alias srm='sudo rm'
alias s='sudo'
alias reboot='sudo reboot'
alias xxx='startx'
alias x='xpdf -fg yellow -bg black'
alias wt='weather.sh'
alias mtusb='s mount /dev/sdb1 /mnt/usbstick'
alias mmk='make && sudo make clean install'
alias background='feh --bg-scale ~/backup/usbstick/wallpapers/Autumn_is_Near.png'
export AWT_TOOLKIT=MToolkit

alias gokgs='javaws http://files.gokgs.com/javaBin/cgoban.jnlp'
alias tv='cd ~/torrents/files && ls'
alias t='tar xvf'
alias tt='tar xvjf'
alias l='less'
alias hwk='uebungpdf.sh'
alias v='vim'
alias sv='sudo vim'
export PATH=$PATH:/home/veel/code/bin

alias mtb='sudo mount /dev/sdb1 /mnt/usbstick && cd /mnt/usbstick && ls'
alias mtc='sudo mount /dev/sdc1 /mnt/etwas && cd /mnt/etwas && ls'
alias umtb='sudo umount /mnt/usbstick'
alias umtc='sudo umount /mnt/etwas'

