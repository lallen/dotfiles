
export NORMAL="$(tput sgr 0)"
export BLACK="$(tput setaf 0)"
export RED="$(tput setaf 1)"
export GREEN="$(tput setaf 2)"
export YELLOW="$(tput setaf 3)"
export BLUE="$(tput setaf 4)"
export MAGENTA="$(tput setaf 5)"
export CYAN="$(tput setaf 6)"
export WHITE="$(tput setaf 7)"
export GRAY="$(tput setaf 244)"

parse_git_dirty() {
  FLAGS=('--porcelain' '--ignore-submodules=dirty')
  STATUS=$(git status ${FLAGS} 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "* "
  else
    echo "" 
  fi
} 

git_current_sha() {
  current_sha=$(git rev-parse --verify HEAD 2> /dev/null )
  if [[ -n $current_sha ]]; then
    echo ${current_sha::6}
  else
    echo "" 
  fi
}

git_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null )
  if [[ -n $branch ]]; then
    echo $branch
  else
    echo "" 
  fi
}
