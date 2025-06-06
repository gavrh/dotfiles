# common bash execs
alias la="ls --group-directories-first --no-group -gha"

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

# region select screenshot
alias rss='maim -s ~/Documents/screenshots/$(date +%s).png'

# logout
alias logout="loginctl terminate-user ''"
