# common bash execs
alias la="ls -a"

# clear w/ neofetch
alias clear="clear && neofetch"

# open nvim config from anywhere
alias nvim-config="nvim ~/.config/nvim"

# air (golang live reload)
alias air="~/go/bin/air"

# cd (easy access to certain files i go to alot)
alias cd-projects="cd ~/Desktop/projects"

# cats (syntax highlighting)
alias cats="highlight -O ansi --force"

# venv python
alias vpython="./venv/bin/python"

# silent java options
_SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
unset _JAVA_OPTIONS
alias java="java \"$_SILENT_JAVA_OPTIONS\""

# make dir and cd into it
mkcd() {
    mkdir -p "${1}"
    cd "${1}"
}
