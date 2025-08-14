# Aliases for zsh
alias o="open ."
alias nzo='~/.scripts/fzf-open.sh'
alias cls='clear'
alias showpswd="security find-generic-password -wa"
alias yz='yazi'
alias fman='compgen -c | fzf | xargs man'
alias nlof='~/.scripts/fzf-lof.sh'
alias neofetch='fastfetch'


# Tmux
alias tkill="tmux kill-session -t \"\$(tmux list-sessions | fzf | cut -d: -f1)\""


# Configs
alias zshconfig='nvim ~/.zshrc'
alias zshaliases='nvim ~/.config/zsh/aliases.zsh'
alias zshcustom='nvim ~/.config/zsh/custom.zsh'
alias zshwork='nvim ~/.config/zsh/work.zsh'
alias ghosttyconfig='nvim ~/.config/ghostty/config'


# Git
alias gaa='git add .'
alias gcm='git commit -m'
alias gpsh='git push'
alias gss='git status -s'
alias gs='git status'


# Eza
alias ls='eza --tree --level=1 --color=always --long --git --sort=size --no-filesize --icons=always --no-time --no-user --no-permissions'
alias ld='eza -lD --color=always --icons=always --sort=size'
alias lf='eza -lF --color=always --icons=always --sort=size | grep -v /'
alias lh='eza -al --color=always --icons=always --sort=modified --group-directories-first'
alias lt='eza -lTg --color=always --icons=always'
alias lt2="eza -lTg --color=always --icons=always --level=2"
alias lt3="eza -lTg --color=always --icons=always --level=3"
alias lta="eza -lTag"

