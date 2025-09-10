export XDG_CONFIG_HOME="$HOME/.config"
export DISABLE_AUTO_UPDATE=true

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/run/current-system/sw/bin:$PATH"

export TMUX_PLUGIN_MANAGER_PATH="~/.tmux/plugins"
export PNPM_HOME="/Users/$USER/Library/pnpm"

export PATH="$PATH:$PNPM_HOME"

export PATH="/Users/$USER/.deno/bin:$PATH"
export PATH="/Users/$USER/.bun/bin:$PATH"
export PATH="/Users/$USER/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source ~/dotfiles/zsh/docker-completions.sh

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
export PATH=$DEVKITARM/bin:$PATH

echo "if [ -f ~/.zshrc ]; then . ~/.zshrc; fi" >> ~/.zprofile

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="eza"
alias cat="ccat"
alias gemini="npx @google/gemini-cli"

function check_venv() {
  if [[ -z "$VIRTUAL_ENV" ]]; then
    if [[ -d ./.venv ]]; then
      source ./.venv/bin/activate
    fi
  else
    parentdir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$PWD"/ != "$parentdir"/* ]]; then
      if whence -w deactivate >/dev/null 2>&1; then
        deactivate
      fi
    fi
  fi
}

function cd() {
  builtin cd "$@"
  check_venv
}

unset VIRTUAL_ENV
check_venv
