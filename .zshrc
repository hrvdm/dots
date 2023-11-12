plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
)

export STARSHIP_CONFIG=~/.config/starship.toml

eval "$(starship init zsh)"

unset ANDROID_SDK_ROOT

export PATH="${PATH}:${HOME}/.local/bin/"
export ANDROID_HOME=~/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export REACT_EDITOR=code
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.rbenv/bin:$PATH"
export macchina="/usr/bin/macchina"

eval "$(rbenv init -)"

alias neofetch=macchina

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

macchina
