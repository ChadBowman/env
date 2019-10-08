#   python
# make pyenv's python available
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#   ruby
# make homebrew's ruby available
export PATH="/usr/local/opt/ruby/bin:$PATH"

# convenience functions

# edit bash profile
ebp() {
    nvim ~/.bash_profile
    source ~/.bash_profile
}

# edit nvim/init.vim
evim() {
    nvim ~/.config/nvim/init.vim
}

# aliases
alias v=nvim
