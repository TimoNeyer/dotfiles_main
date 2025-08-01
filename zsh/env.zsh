export EDITOR=vim
export VISUAL=vim
export GPG_TTY=$(tty)
export ZVM_VI_ESCAPE_BINDKEY=jj
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export ATUIN_NOBIND="true"
