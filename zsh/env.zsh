export EDITOR=vim
export VISUAL=vim
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

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
