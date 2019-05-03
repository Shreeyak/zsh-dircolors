
# Return if requirements are not found.
if (( ! $+commands[dircolors] )); then
  return 1
fi

function _setup_dircolors {
  local dircolors_dir
  local theme
  local theme_path

  dircolors_dir="${ZSH_DIRCOLORS_DIR:-${0:A:h}/dircolors}"
  zstyle -s ':pszynk:module:dircolors' theme 'theme' || theme='dircolors.ansi-universal'
  theme_path="${dircolors_dir}/${theme}"

  if [[ -f $theme_path ]]; then
    eval $(dircolors $theme_path)
    return 0
  fi

  print "Could not load dircolors theme, file not found: '$theme_path'" >&2
  return 1
}

_setup_dircolors $@
