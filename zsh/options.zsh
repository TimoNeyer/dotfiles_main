# ===== VIM MODE OPTIONS =====
export ZVM_VI_ESCAPE_BINDKEY=jj
# this seems to not work right now
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_ESCAPE_BINDKEY=jj
  ZVM_VI_HIGHLIGHT_BACKGROUND=green
}

function zvm_after_init() {
    zvm_bindkey viins '^R' fzf-history-widget
    zvm_bindkey vicmd '/' fzf-history-widget
}

# ===== ZSH OPTIONS =====
# History
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry
setopt HIST_VERIFY               # Don't execute immediately upon history expansion

# Directory navigation
setopt AUTO_CD                   # Auto change to a directory without typing cd
setopt AUTO_PUSHD                # Push the old directory onto the stack on cd
setopt PUSHD_IGNORE_DUPS         # Do not store duplicates in the stack
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd

# Completion
setopt AUTO_MENU                 # Show completion menu on successive tab press
setopt ALWAYS_TO_END             # Move cursor to end if word had one match
setopt COMPLETE_IN_WORD          # Complete from both ends of a word
setopt FLOW_CONTROL              # Disable flow control (ctrl-s/ctrl-q)

# Miscellaneous
setopt INTERACTIVE_COMMENTS      # Allow comments in interactive mode
setopt MAGIC_EQUAL_SUBST         # Enable filename expansion for arguments of form 'anything=expression'
setopt NO_BEEP                   # Disable beep on error
setopt PROMPT_SUBST              # Enable parameter expansion, command substitution, and arithmetic expansion in prompts

# ===== HISTORY CONFIGURATION =====
export HISTFILE="$HOME/.local/state/zsh/history.zsh"
export HISTSIZE=50000
export SAVEHIST=50000

# ===== FZF CONFIGURATION =====
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND=""
export FZF_ALT_C_COMMAND=''
export FZF_DEFAULT_OPTS='
  --height 40% --layout=reverse --border
  --bind ctrl-j:accept,ctrl-k:kill-line
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

if [[ -d "$HOME/.config/zsh/overrides.d.local" ]]; then
  for file in $HOME/.config/zsh/overrides.d.local/* ; do
    source $file
  done
fi
