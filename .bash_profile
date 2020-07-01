#--- source local config
source ~/.bash_profile-local

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

alias p=python

# make pyenv's python available
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

#--- ruby

# make RVM's ruby available
if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi

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
function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

#--- environment variables

# pretty logs
export DEV_LOGGING=1

# pretty terminal
export PS1="\[\e[33m\]\w\[\e[m\] on \[\e[31m\]\$(parse_git_branch)\[\e[m\] \$ "
