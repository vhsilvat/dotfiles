plugins=(git)

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

