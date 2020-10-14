# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
### CUSTOM ####
export THEME_SHOW_CLOCK=true
export THEME_CLOCK_COLOR="$normal"
export THEME_CLOCK_FORMAT="%H:%M:%S"


alias mgit="cd /home/jooho/RHB/dev/git/mine"
alias dgit="cd /home/jooho/dev/git"
alias p="podman"
#alias python='/usr/bin/python3.6'
alias pip='/usr/local/bin/pip3'


#PATH
export USER_PY_PATH=~/.local/bin
export LANG_PATH=/home/jooho/dev/lang
export JENKINSX_PATH=${LANG_PATH}/jenkinsx
export MINISHIFT_PATH=${LANG_PATH}/minishift-1.26.1
export TERRAFORMS_PATH=${LANG_PATH}/terraforms
export MVN_PATH=${LANG_PATH}/maven
export NODE_PATH=${LANG_PATH}/node
export GRADLE_PATH=${LANG_PATH}/gradle
export GOROOT=${LANG_PATH}/go
export GOBIN=${GOROOT}/bin
export GOPATH=/home/jooho/dev/lang/gopath
export IDE_PATH=/home/jooho/dev/ide
export WEBSTOME_PATH=${IDE_PATH}/webstorm
export GOLAND_PATH=${IDE_PATH}/goland
export INTELLIJ_PATH=${IDE_PATH}/intellij/idea
export DATAGRIP_PATH=${IDE_PATH}/intellij/datagrip
export ANDROID_STUDIO_PATH=${IDE_PATH}/android-studio
export KUBEBUILDER=/usr/local/kubebuilder/bin

export PATH=${PATH}:${USER_PY_PATH}:${JENKINSX_PATH}:${MINISHIFT_PATH}:${TERRAFORMS_PATH}:${MVN_PATH}/bin:${NODE_PATH}/bin:${GOBIN}:${WEBSTOME_PATH}/bin:${GOLAND_PATH}/bin:${INTELLIJ_PATH}/bin:${DATAGRIP_PATH}/bin/:${GRADLE_PATH}/bin:${ANDROID_STUDIO_PATH}/bin:${KUBEBUILDER}


# AWS
export AWS_DEFAULT_PROFILE="default"
export AWS_PROFILE="$AWS_DEFAULT_PROFILE"

# KVM
#export DISPLAY=:0.0


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Path to the bash it configuration
export BASH_IT="/home/jooho/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-plain'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

export WORKON_HOME=~/VirtualEnvs
source ~/.local/bin/virtualenvwrapper.sh 

#export GOBIN=/tmp/go/bin
#export GOPATH=/tmp/go
#export PATH=${GOBIN}:${PATH}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jooho/.sdkman"
[[ -s "/home/jooho/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jooho/.sdkman/bin/sdkman-init.sh"
. "/home/jooho/.acme.sh/acme.sh.env"
