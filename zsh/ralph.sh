ralph() {
  local iterations=5
  local model="zai-coding-plan/glm-4.7"
  local user_prompt=""

  local OPTIND
  while getopts "i:m:f:p:" opt; do
    case "$opt" in
    i) iterations=$OPTARG ;;
    m) model=$OPTARG ;;
    p) user_prompt=$OPTARG ;;
    *)
      echo "Usage: ralph [-i iterations] [-m model] [-f file] -p prompt"
      return 1
      ;;
    esac
  done
  shift $((OPTIND - 1))

  if [ -z "$user_prompt" ]; then
    echo "Error: The -p flag (prompt) is mandatory."
    echo "Usage: ralph [-i iterations] [-m model] [-f file] -p prompt"
    return 1
  fi

  for ((i = 1; i <= iterations; i++)); do
    echo "--- Iteration $i of $iterations ---"

    # Build prompt with context markers, user prompt, and mandatory footer
    local prompt_text="$user_prompt \
Do NOT commit if any feedback loop fails. Fix issues first. \
ONLY WORK ON A SINGLE FEATURE. \
If, while searching for a task you realise that there is nothing \
left to do, output <promise>COMPLETE</promise>."

    result=$(opencode run -m "$model" "$prompt_text")

    echo "$result"

    if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
      echo "PRD complete, exiting."
      exit 0
    fi
  done
}
