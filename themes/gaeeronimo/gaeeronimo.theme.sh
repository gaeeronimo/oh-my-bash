
# oh-my-bash themeing is too slow for me on git-for-windows
# use the default prompt with a simple addition
if [[ "$OSTYPE" == *msys* ]]; then

    # Based on git-for-windows default git prompt
    source "/etc/profile.d/git-prompt.sh"

    function prompt_status {

        local EXIT=$?
        local CHAR_NOK='✗'
        local CHAR_OK='✓'
        local ECHO_RED="\e[1;31m"
        local ECHO_GREEN="\e[1;32m"
        local ECHO_RESET="\e[0m"

        if [ $EXIT -eq 0 ]; then
            echo -e "${ECHO_GREEN}${CHAR_OK}${ECHO_RESET} "
        else
            echo -e "${ECHO_RED}${CHAR_NOK} (${EXIT})${ECHO_RESET} "
        fi
    }

	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'`prompt_status`'    # exit status
	PS1="$PS1"'\[\033[32m\]'       # change to green
	PS1="$PS1"'\u@\h '             # user@host<space>
	PS1="$PS1"'\[\033[35m\]'       # change to purple
	PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
	PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
	PS1="$PS1"'\w'                 # current working directory
    PS1="$PS1"'\[\033[36m\]'       # change color to cyan
    PS1="$PS1"'`__git_ps1`'        # bash function
	PS1="$PS1"'\[\033[0m\]'        # change color
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\$ '  

else
    # On other systems use a configured theme
    source "$OSH/themes/$NON_WINDOWS_THEME/$NON_WINDOWS_THEME.theme.sh"
fi
