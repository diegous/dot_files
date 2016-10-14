# Include original ubuntu bashrc
if [ -f ~/.bashrc_ubuntu ]; then
    . ~/.bashrc_ubuntu
fi

# Use vi commands in console
set -o vi

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Exports
export PATH="$HOME/templ/drivers/google_chrome_driver:$PATH"
export PATH="$HOME/templ/drivers/geckodriver:$PATH"
export PATH="$HOME/templ/drivers/phantomjs/bin:$PATH" 

# Function to change current bash tab title
set-title(){
  ORIG=$PS1
  TITLE="\e]2;$@\a"
  PS1=${ORIG}${TITLE}
}

# Function to enable and disable TouchPad
touchpad(){
  TOUCHPAD_ID="$(xinput | grep "TouchPad" | cut -f2 | cut -d"=" -f2)"
  case "$1" in
    "on")
      xinput --enable $TOUCHPAD_ID
      ;;
    "off")
      xinput --disable $TOUCHPAD_ID
      ;;
    *)
      echo "Incorrect command, try 'on' or 'off'."
      ;;
   esac
}

# Show the name of the branch
function git_branch(){
 __git_ps1
}

export PS1="\w\$(git_branch)$ "


