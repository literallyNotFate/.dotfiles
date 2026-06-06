# Custom settings for zsh

# fzf with fd
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% " 

# Use fd to list path candidates
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Fzf + history integration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Fzf git
source ~/.scripts/fzf-git.sh

# Fix cursor
function fix_cursor_ibeam() {
  echo -ne "\e[6 q"
}

autoload -U add-zsh-hook
add-zsh-hook precmd fix_cursor_ibeam

# Rename tmux session with fzf and input
trename() {
    local session newname
    session=$(tmux list-sessions | fzf | cut -d: -f1) || return
    vared -p "New name for session '$session': " newname
    [[ -n "$newname" ]] && tmux rename-session -t "$session" "$newname"
}

# Angular CLI completion
source <(ng completion script)

