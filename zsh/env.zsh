export ZVM_VI_ESCAPE_BINDKEY=jj
export EDITOR=vim
export VISUAL=vim
export venv="/tmp"
export XDG_CONFIG_HOME=~/.config
export GPG_TTY=$(tty)
export T_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export LC_ALL=en_US.UTF-8

if [[ -z "$ANON_SHELL" ]]; then
  export HISTFILE=~/.zsh_history
  export HISTSIZE=100000
  export SAVEHIST=100000
  setopt appendhistory
else
  export HISTFILE=/dev/zero
  export HISTSIZE=0
  export SAVEHIST=0
fi

#export ZDOTDIR='~/.config/zsh'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
