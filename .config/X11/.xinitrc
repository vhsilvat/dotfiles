#!/bin/sh

xrdb -merge ~/.config/X11/Xresources

# inicia o controlador de audio
start-pulseaudio-x11

# seta o layout br no teclado
setxkbmap -layout us,br -variant ,abnt2 -option grp:ralt_rshift_toggle

# inicia o gerenciador de notificações
dunst &

# inicia o compositor
picom &

# inicia o bloqueador de luz azul
redshift &

# seta o wallpaper
setwall &

# desativa o modo de powersave e desligamento de tela
powersaving &

# inicia o dmwblocks
dwmblocks &
#~/.config/suckless/dwmblocks/daemons/pulse_daemon.sh &

# inicia o dwm
while true; do
	dwm 2> ~/.cache/dwm.log
done
