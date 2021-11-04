#
# ~/.zprofile
#

# Adiciona '~/.local/bin' ao $PATH
export PATH=$(du "$HOME/.local/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH

# Programas default
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="st"
export PAGER="less"
export BROWSER="brave"

# Definição das variáveis
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Clean up da home
export XINITRC="$XDG_CONFIG_HOME/X11/.xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GOPATH="$XDG_DATA_HOME/go"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"

# Correção de display pras aplicações java
export AWT_TOOLKIT="MToolkit wmname LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

# lf icons
if [ -f $XDG_CONFIG_HOME/lf/icons ]; then
    . $XDG_CONFIG_HOME/lf/icons
fi

# Autostart x ao logar
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
	exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
