# Zsh for work environment

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.pyenv/versions/3.12.2/bin:$PATH"

. "$HOME/.cargo/env"

export GOPATH=$HOME/.local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

alias g++="g++ -std=c++17"

export PATH=/usr/local/Caskroom/sqlcl/24.3.0.285.0530/sqlcl/bin:"$PATH"

export DOTNET_ROOT=$(brew --prefix)/opt/dotnet/libexec
export PATH=$DOTNET_ROOT:$PATH

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
