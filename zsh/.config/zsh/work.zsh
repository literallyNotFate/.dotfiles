# Zsh for work environment

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.pyenv/versions/3.12.2/bin:$PATH"

. "$HOME/.cargo/env"

export GOPATH=$HOME/.local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

alias g++="g++ -std=c++17"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# Enabling Iris
eval "$(iris init)"
