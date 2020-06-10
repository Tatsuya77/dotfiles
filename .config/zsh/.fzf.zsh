# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tatsu/ProgramFiles/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/tatsu/ProgramFiles/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tatsu/ProgramFiles/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tatsu/ProgramFiles/fzf/shell/key-bindings.zsh"

fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}
