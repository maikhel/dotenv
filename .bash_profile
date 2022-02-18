if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias gs='git status'
alias gc='git checkout .'

alias ls='ls -Gl'
alias ll='ls -la'
# show hidden files
alias l.='ls -d .* -G'

# go env setup
export GOPATH=$HOME/Projects/go
export GOROOT=/usr/local/opt/go/libexec
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# for vim locals
export LC_ALL=pl_PL.UTF-8

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="~/.rbenv/shims:/usr/local/bin:/usr/local/opt/python/libexec/bin:/usr/local/sbin:/usr/local/bin/python3:/Users/maikhel/opt/pact/bin:/usr/local/bin/terraform:/usr/local/bin/vim:~/.local/bin:$PATH" # use newer vim, installed by brew
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libxslt/bin:$PATH"
export PATH="/usr/local/opt/libiconv/bin:$PATH"
# export CPATH="/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include"


# GIT FUNCTIONS
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# TERMINAL PROMPT
PS1="\u:\W\$(git_branch)$ "
export PS1;
