
# Return if requirements are not found.
if (( ! $+commands[dircolors] )); then
  return 1
fi

function _setup_dircolors {
  local dircolors_dir
  local scheme
  local scheme_path

  dircolors_dir="${ZSH_DIRCOLORS_DIR:-${0:A:h}/dircolors}"
  zstyle -s ':pszynk:module:dircolors' scheme 'scheme' || scheme='dircolors.ansi-universal'

  scheme_path="${dircolors_dir}/${scheme}"
  if [[ ! -f $scheme_path ]]; then
    scheme_path="${dircolors_dir}/dircolors.${scheme}"
    if [[ ! -f $scheme_path ]]; then
      print "Could not load dircolors scheme, file not found: '$scheme_path'" >&2
      return 1
    fi
  fi

  unset LS_COLORS && eval $(dircolors $scheme_path)
  if [[ $LS_COLORS = '' ]]; then
     print "Dircolor scheme '${scheme_path}' does not support terminal '${TERM}'!" >&2
     return 1
  fi
  return 0

}

_setup_dircolors $@
