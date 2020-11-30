#--- zsh
# navigation
setopt no_case_glob
setopt auto_cd

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'
setopt prompt_subst

# set prompt
prompt='%(?.🚀.🤖) %F{yellow}%3~ %F{white}on %F{red}${vcs_info_msg_0_} %F{white}%# '

# edit zsh
ezsh() {
  nvim ~/.zshrc
  source ~/.zshrc
}

#--- git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'

#--- neovim
alias v=nvim

evim() {
    nvim ~/.config/nvim/init.vim
}

#--- python 🐍
alias p=python

# make pyenv's python available
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# shortcut for unit tests
alias pytest='python -m unittest discover -v'

#--- ruby ♦️
# make RVM's ruby available
if [[ -s $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm;
fi

#--- java ☕️
# make jenv's java available
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#--- Gradle
alias g=./gradlew

#--- docker 🐳
alias dm='docker-machine'
function dm_create() {
    docker-machine create --driver virtualbox $1
}
function dm_env() {
    docker-machine env $1
    eval $(docker-machine env $1)
}

# source local config
if [[ -s ~/.zshrc-local ]]; then
    source ~/.zshrc-local;
fi
