export STARSHIP_CONFIG=~/.config/starship/starship.toml
export BAT_CONFIG_PATH="$HOME/.cache/iris/gen/bat/bat.conf"

export FZF_DEFAULT_OPTS="--multi \
  --height=50% \
  --layout=reverse \
  --border=rounded \
  --preview-window=border-rounded \
  --prompt='❯ ' \
  --marker='◉ ' \
  --pointer='▌ ' \
  --separator='─' \
  --scrollbar='│'"

# Import fzf theme from iris
[ -f ~/.cache/iris/bin/fzf.sh ] && source ~/.cache/iris/bin/fzf.sh

