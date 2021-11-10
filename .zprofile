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
export BTPD_HOME="$HOME/downloads/torrents"

# Correção de display pras aplicações java
export AWT_TOOLKIT="MToolkit wmname LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

# Configuração custom do pfetch
export PF_INFO="ascii title os kernel pkgs memory wm shell term editor palette"

# Configuração custom do fzf
export FZF_DEFAULT_COMMAND='fd -t f -L -H -c always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
    --ansi --border --height 100%
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
    --color info:#83a598,prompt:#a89984,pointer:#83a598,marker:#fe8019,spinner:#fabd2f,header:#665c54
    --preview "bat --color always --theme="gruvbox-dark" {}" --preview-window :70%'

# lf icons
if [ -f $XDG_CONFIG_HOME/lf/icons ]; then
    . $XDG_CONFIG_HOME/lf/icons
fi

# Autostart x ao logar
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
	exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
