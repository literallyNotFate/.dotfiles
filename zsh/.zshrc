export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"

export EDITOR='nvim'
export VISUAL="$EDITOR"
export XDG_CONFIG_HOME="$HOME/.config"

# Plugins for zsh
plugins=(git
	 zsh-autosuggestions
	 web-search
 	 copyfile
 	 copybuffer
 	 jsontools
	 zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Import aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# Import settings for work (paths etc) 
[ -f "$HOME/.config/zsh/work.zsh" ] && source "$HOME/.config/zsh/work.zsh"

# Import custom settings (themes, configs for fzf)
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"


# Load Angular CLI autocompletion.
source <(ng completion script)

# Starship config
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Starship configuration
eval "$(starship init zsh)"
