# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/zhonghai/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/zhonghai/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/zhonghai/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/zhonghai/.fzf/shell/key-bindings.bash"

