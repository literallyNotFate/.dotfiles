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

# Import custom settings
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Import theme settings for cli stuff (w/iris)
[ -f "$HOME/.config/zsh/themes.zsh" ] && source "$HOME/.config/zsh/themes.zsh"

