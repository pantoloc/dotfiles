xrdb -merge ~/.Xresources &
emacs --daemon &
#urxvtd -q -o -f &
mpd &
xmodmap ~/.xmodmap &
#~/.xmonad/autostart.sh &
statusbarscript.sh &
#exec pekwm
#exec subtle
#exec xmonad
#exec catwm
exec dwm
