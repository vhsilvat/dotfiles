#
# ~/.zprofile
#

# Adiciona '~/.local/bin' ao $PATH
export PATH=$(du "$HOME/.local/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH
# Adiciona o postgresql ao $PATH
export PATH=$(du "/usr/local/pgsql/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH
export OPENAI_API_KEY=""

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
export XDG_STATE_HOME="$HOME/.local/state"

# Clean up da home
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export BTPD_HOME="$HOME/downloads/torrents"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export W3M_DIR="$XDG_STATE_HOME/w3m"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/.xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Correção de display pras aplicações java
export AWT_TOOLKIT="MToolkit wmname LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

# Configuração custom do pfetch
export PF_INFO="ascii title os kernel pkgs memory wm shell term editor palette"

# LESS config
export LESS='-g -i -M -R -S -w -z-4'
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# Configuração custom do fzf
export FZF_DEFAULT_COMMAND='fd --type f -L -H -c always'
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
