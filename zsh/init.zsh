#!/usr/bin/env zsh

# safety inside this
set -eo pipefail
function __zsh_conf_bail() { echo "Error in zsh config";  sh}
trap __zsh_conf_bail ERR

source "$HOME/.config/zsh/options.zsh"
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && 
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" || true

# ===== ZI PLUGIN MANAGER =====
source ${XDG_CONFIG_HOME:-${HOME}}/.config/zi/init.zsh && zzinit
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# ===== PLUGINS =====
# FZF integrations
zi wait lucid for \
    multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null" \
        junegunn/fzf \
    id-as"fzf-history" atinit'zicompinit'\
      unixorn/fzf-zsh-plugin \
    pick"fzf-tab.plugin.zsh" \
        Aloxaf/fzf-tab
zi cdclear -q

zi light-mode for \
  z-shell/z-a-meta-plugins \
    @annexes \
    @py-utils \
    @romkatv \
    skip'forgit' @ext-git \
  atload'source ~/.config/zsh/options.zsh' \
  jeffreytse/zsh-vi-mode
  

zi wait lucid for \
  atinit'ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay;' atload'fast-theme default &>/dev/null;' compile'{functions/{.fast,fast}-*~*.zwc,chroma/*~*.zw' \
     z-shell/F-Sy-H \
  blockf \
     zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
     zsh-users/zsh-autosuggestions \
  ajeetdsouza/zoxide

# Additional colorful plugins
zi wait lucid for \
    OMZP::colored-man-pages \
    OMZP::command-not-found \
    atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"' \
        trapd00r/LS_COLORS

# ===== COMPLETION STYLING =====

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Use menu selection
zstyle ':completion:*' menu select

# Group matches and describe
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Enable approximate matching
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric


# ===== KEY BINDINGS =====
bindkey -v
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3;5~' kill-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# ===== SOURCE CUSTOM FILES =====

source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/aliases.zsh"

# ===== FINAL SETUP =====
autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd
zicompinit
zi cdreplay -q
set +eo pipefail
trap ' ' ERR
unset -f __zsh_conf_bail

# ===== POWERLEVEL10K CONFIG =====
source ~/.p10k.zsh # this is not suited for safety area
