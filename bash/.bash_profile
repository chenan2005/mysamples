# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export LANG=zh_CN.utf8
ulimit -c 4294967296

export PATH

function parse_git_branch {

  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'

}

function proml {

  local        	BLUE="\[\033[0;34m\]"

  local		LIGHT_BLUE="\[\033[1;34m\]"

  local         RED="\[\033[0;31m\]"

  local   	LIGHT_RED="\[\033[1;31m\]"

  local       	GREEN="\[\033[0;32m\]"

  local 	LIGHT_GREEN="\[\033[1;32m\]"

  local       	YELLOW="\[\033[0;33m\]"

  local 	LIGHT_YELLOW="\[\033[1;33m\]"

  local       	WHITE="\[\033[1;37m\]"

  local  	LIGHT_GRAY="\[\033[0;37m\]"

  local     	DEFAULT="\[\033[0m\]"

PS1="$GREEN[\t]$YELLOW[\u@\h] $YELLOW\$(parse_git_branch)
$DEFAULT\w $ "

PS2='> '

PS4='+ '

}

proml

export LS_COLORS=$(echo $LS_COLORS | sed "s/di=[0-9][0-9];[0-9][0-9]:/di=00;31:/g")
