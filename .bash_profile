# System aliases
alias ls='ls -Gp'
alias lsa='ls -Gpa'
alias lsal='ls -Gpal'

# Git aliases
alias gcmp='git checkout master && git pull'
alias gfor='git fetch origin && git rebase origin/master'
alias gp='git pull'
alias gs='git status'

# Base16 Colors
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Enable FZF with fd
export FZF_DEFAULT_COMMAND="fd ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'

source ~/.bashrc

