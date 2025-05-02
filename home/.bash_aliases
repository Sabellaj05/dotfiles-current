#>>>>> Terminal >>>>>

## ls stuff
#alias lsx='exa -la --icons -h'
#alias lsx='eza -la --icons -h'
alias ls='exa -la --icons -h --group-directories-first'
alias lxs='exa --icons'
alias lxd='exa -a --icons --group-directories-first'

# list upgradable
alias nlu='nala list --upgradable'

## clipboard thingy
# alias xcp='xclip -sel c'
## clipboard thingy (Wayland version)
alias xcp='wl-copy'

## cd's
alias ..='cd ..'
alias ...='cd ../..'
alias unlu='cd ~/Documents/repos-github/UNLu'
alias hub='cd ~/Documents/repos-github/projects'

#>>>> Software >>>>

## Qtile
## Restart config when broken
alias qtile-reload='qtile cmd-obj -o cmd -f reload_config'

## fulL HACKER
alias neo='cmatrix -b -C blue'

## git
alias gst='git status'
alias glo='git log --oneline'
alias glg='git log --all --graph'

## neovim
alias vim='nvim'

## jupyter 
alias jpn='jupyter notebook --no-browser'
alias jpl='jupyter lab --no-browser'

## Cursor from the command line
alias cursor='/usr/local/bin/cursor --no-sandbox'

#>>>> OS >>>>
## Windows C Drive
alias win-c='cd /media/don/9EEE3C3BEE3C0DD1/Users/manum/'

## Windows D Drive
alias win-d='cd /media/don/Discardo/'

## Linux version
alias linuxv='lsb_release -a'
alias linuxinfo='uname -m && cat /etc/*release'
alias linuxkernel='uname -srmv'

# Spawn terminall
# `Alacritty New Terminal`
alias ant='alacritty --working-directory $(pwd) >/dev/null 2>&1 &'
