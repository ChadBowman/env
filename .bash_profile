#--- git

alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'

#--- neovim

alias v=nvim

#--- python

# make pyenv's python available
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#--- ruby

# make homebrew's ruby available
export PATH="/usr/local/opt/ruby/bin:$PATH"

#--- convenience functions

# edit bash profile
ebp() {
    nvim ~/.bash_profile
    source ~/.bash_profile
}

# edit nvim/init.vim
evim() {
    nvim ~/.config/nvim/init.vim
}

# parse current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

#--- environment variables

# pretty logs
export DEV_LOGGING=1

# pretty terminal
export PS1="\[\e[33m\]\w\[\e[m\] on \[\e[31m\]$(parse_git_branch)\[\e[m\] $ "
