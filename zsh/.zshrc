export XDG_CONFIG_HOME="$HOME/.config"
export DISABLE_AUTO_UPDATE=true

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"
export PATH="/run/current-system/sw/bin:$PATH"

export PNPM_HOME="/Users/$USER/Library/pnpm"

export PATH="$PATH:$PNPM_HOME"

export PATH="/Users/$USER/.deno/bin:$PATH"
export PATH="/Users/$USER/.bun/bin:$PATH"
export PATH="/Users/$USER/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source ~/dotfiles/zsh/docker-completions.sh

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
export PATH=$DEVKITARM/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="eza"
alias cat="ccat"
alias gemini="npx @google/gemini-cli"
alias pip="uv pip"

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

# bun completions
[ -s "/Users/nicolas/.bun/_bun" ] && source "/Users/nicolas/.bun/_bun"

# Created by `pipx` on 2025-09-25 14:56:42
export PATH="$PATH:/Users/nicolas/.local/bin"

# Added by Antigravity
export PATH="/Users/nicolas/.antigravity/antigravity/bin:$PATH"

# Load secrets from git-ignored file
[ -f ~/dotfiles/zsh/.zshrc.secrets ] && source ~/dotfiles/zsh/.zshrc.secrets

ralph_local() {
  local iterations=5
  local model="zai-coding-plan/glm-4.7"
  local prd_file="prd.json"
  local extra_item=""

  # Parse flags
  local OPTIND
  while getopts "i:m:f:p:" opt; do
    case "$opt" in
      i) iterations=$OPTARG ;;
      m) model=$OPTARG ;;
      f) prd_file=$OPTARG ;;
      p) extra_item=$OPTARG ;;
      *) echo "Usage: ralph [-i iterations] [-m model] [-f file] [-p extra_prompt]"; return 1 ;;
    esac
  done
  shift $((OPTIND - 1))

  for ((i = 1; i <= iterations; i++)); do
    echo "--- Iteration $i of $iterations ---"

    # Build prompt dynamically
    local prompt_text="@$prd_file @progress.txt
1. Decide which task to work on next. This should be the one YOU decide has the highest priority.
2. Check any feedback loops, such as types and tests.
3. Append your progress to the progress.txt file.
4. Make a git commit of that feature."

    # Add the 5th item if -p was provided
    if [ -n "$extra_item" ]; then
      prompt_text="$prompt_text
5. $extra_item"
    fi

    # Add the closing footer
    prompt_text="$prompt_text
    Before committing, run ALL feedback loops: \
1. TypeScript: bun run tsc (must pass with no errors) \
2. Tests: bun run test (must pass) \
3. Lint: bun run lint (must pass) \
Do NOT commit if any feedback loop fails. Fix issues first. \
ONLY WORK ON A SINGLE FEATURE.
If, while implementing the feature, you notice that all work
is complete, output <promise>COMPLETE</promise>."

    # Execute
    result=$(opencode run -m "$model" "$prompt_text")
    echo "$result"

    if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
      echo "PRD complete, exiting."
      return 0
    fi
  done
}
