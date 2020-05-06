if [[ "$OSTYPE" == *msys* ]]; then

    # Alias for tools that need to be started with winpty
    alias python="winpty python"
    alias python3="winpty python3"
    alias pip="winpty pip"
    alias py="winpty py"

    # Alias for tools normally not in path
    alias micro="winpty --mouse micro"
    alias kdiff3="/c/Program\ Files/KDiff3/Kdiff3.exe"

    # Directory handling
    function winpath()
    {
        {
            cd "`dirname "$1"`" && pwd -W
        } | sed 's|/|\\|g'
    }

    function to_windir()
    {
        echo "`winpath "$1"`\\`basename "$1"`"
    }

    function cur_windir()
    {
        to_windir "$(pwd)"
    }

    # Open folders or files
    function ex ()
    {
        local wd
        if [ -z "$1" ]; then
            wd=`cur_windir`;
        else
            wd="$1"
            if [ ! -d "$1" ]; then
                wd=`dirname "$1"`
            fi
        fi
        echo "open: $wd";
        explorer "$wd"
        true
    }

    function x ()
    {
        local item="${1:-.}"
        if [ -d "$item" ]; then
            ex "$item"
        else
            cmd //c `to_windir "$item"`
        fi
    }
fi