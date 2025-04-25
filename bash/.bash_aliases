# common bash execs
alias lau="ls -la --time-style=long-iso --color=always | grep -v '^total' | awk '{printf \"%s %+2s %+4s %s %s\n\", \$1, \$2, \$5, \$6, \$8}'"
alias la="lau | head -n 2 && lau | tail -n +3 | sort -k1.1,1.1 -r"

# clear w/ neofetch
alias clear="clear && neofetch"

# open nvim config from anywhere
alias nvim-config="nvim ~/.config/nvim"

# air (golang live reload)
alias air="~/go/bin/air"

# cats (syntax highlighting)
alias cats="highlight -O ansi --force"

# venv python
alias vpython="./venv/bin/python"

# make dir and cd into it
mkcd() {
    mkdir -p "${1}"
    cd "${1}"
}

# logout
alias logout="loginctl terminate-user ''"
