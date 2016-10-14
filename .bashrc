# Include original ubuntu bashrc
if [ -f ~/.bashrc_ubuntu ]; then
  . ~/.bashrc_ubuntu
fi

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Exports
export PATH="$HOME/programming/drivers/google_chrome_driver:$PATH"
export PATH="$HOME/programming/drivers/geckodriver:$PATH"
export PATH="$HOME/programming/drivers/phantomjs/bin:$PATH"

# Export custom commands
export PATH="$HOME/.bin:$PATH"

# Add current git branch to prompt (with colors)
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\e]0;\u@\h \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch) \[\033[01;34m\]\$\[\033[00m\] "
