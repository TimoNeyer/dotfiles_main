function _git_stats() {
    if [[ "$GIT_BRANCH" =~ "off" ]]; then
      GIT_BRANCH='[off] '
      return 0
    fi
    GIT_BRANCH=""
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)

    local changes=""
    if ! git diff --quiet --ignore-submodules --; then
        changes=" ✗"
    fi

    if ! git diff --cached --quiet --ignore-submodules --; then
        changes+="●"
    fi

    if [[ -n $(git ls-files --others --exclude-standard) ]]; then
        changes+="+"
    fi

    local ahead behind
    ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null || echo 0)
    behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null || echo 0)

    local sync_status=""
    [[ "$ahead" -gt 0 ]] && sync_status=" ↑$ahead"
    [[ "$behind" -gt 0 ]] && sync_status+=" ↓$behind"

    if [[ -n "$GIT_BRANCH" ]]; then
      GIT_BRANCH+=" "
    fi
    GIT_BRANCH="($branch$sync_status$changes)"
}

function _set_prompt() {
  if [[ "$?" -eq 0 ]]; then
    PROMPT="%F{blue}%n%f@%F{blue}%m:%F{magenta}%~ %F{yellow}${GIT_BRANCH}%f|${ZVM_MODE}| > "
  else
    PROMPT="%F{blue}%n%F{red}@%F{blue}%m:%F{magenta}%~ %F{yellow}${GIT_BRANCH}%f|${ZVM_MODE}| > "
  fi
  _git_stats
  RPROMPT='[%F{cyan}%T%f]'
}
