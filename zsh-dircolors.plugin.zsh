# get the directory from when we're sourced
_ZSH_DIRCOLORS_DIR="${ZSH_DIRCOLORS_DIR:-${${0:A}:h}/dircolors}"
_ZSH_DIRCOLORS_CONF="${ZSH_DIRCOLORS_CONF:-$HOME/.zsh-dircolors.config}"

function lsdircolors ()
{
    for i in ${_ZSH_DIRCOLORS_DIR}/dircolors.*
    do
        echo $(basename ${i})
    done
}

function setupdircolors ()
{
    local _dircolors_theme=${1:-'dircolors.ansi-universal'}

    local _dircolors_theme_path="$_ZSH_DIRCOLORS_DIR/${_dircolors_theme}"
    if [[ -f $_dircolors_theme_path ]]; then
        eval $(dircolors $_dircolors_theme_path)
    else
        echo "Could not load dircolors theme: '$_dircolors_theme_path'"
    fi

    # Save the settings to a file
    setopt CLOBBER
    echo $_dircolors_theme > $_ZSH_DIRCOLORS_CONF
    unsetopt CLOBBER
}

[[ -e $_ZSH_DIRCOLORS_CONF ]] && setupdircolors $(cat $_ZSH_DIRCOLORS_CONF)
