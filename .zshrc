# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/thiphariel/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(composer git git-flow history last-working-dir sudo)

source $ZSH/oh-my-zsh.sh

# User configuration
setopt completealiases

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='gedit'
else
  export EDITOR='gedit'
fi
 
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export EDITOR=/usr/bin/gedit
export PATH=$PATH:/home/thiphariel/Android/Sdk/emulator

# Run screenfetch on launch
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases

# Functions aliases
svim() {
  sudo -E vim $1
}

avd() {
  # Try if an argument is provided, else, launch the first founded emulator
  if [ -z "$1" ]; then
    AVD_NAME=$(emulator -list-avds | head -n 1)
  else
    AVD_NAME=$1
  fi

  emulator @$AVD_NAME &
  disown
}
