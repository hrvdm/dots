plugins=(
  git 
)

export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:~/.cargo/bin/

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export REACT_EDITOR=code
export NVM_DIR="$HOME/.nvm"

eval "$(rbenv init -)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

macchina
