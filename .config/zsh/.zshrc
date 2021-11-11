#
# ~/.zshrc
#

#
# HISTORICO
#

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.cache/zsh/zsh_history"
# persiste comandos de todos os terminais abertos
setopt INC_APPEND_HISTORY
# ignora comandos duplicados adjacentes
setopt HIST_IGNORE_DUPS

#
# SOURCE
#

# Carrega as funções
[ -f "$ZDOTDIR/.zfunctions" ] && source "$ZDOTDIR/.zfunctions"
# Carrega os atalhos
[ -f "$ZDOTDIR/.zaliases" ] && source "$ZDOTDIR/.zaliases"
# Carregas as configurações do prompt
[ -f "$ZDOTDIR/.zprompt" ] && source "$ZDOTDIR/.zprompt"


# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

