#!/usr/bin/env bash

# This script is used by Makers to ensure that the challenges stay up to date.
# If you're a student, you don't need to run it. But you can if you like!

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

cleanup() {
  trap - SIGINT SIGTERM ERR
  die "${RED}Checks failed${NOFORMAT}"
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

setup_colors

msg "${BLUE}Integrity check using Ruby version ${ORANGE}$(ruby -v)${NOFORMAT}"
msg "${BLUE} • Installing bundler${NOFORMAT}"
gem install bundler
msg "${BLUE} • Running bundle install${NOFORMAT}"
bundle install
msg "${BLUE} • Running rspec${NOFORMAT}"
bundle exec rspec
msg "${BLUE} • Running rubocop${NOFORMAT}"
bundle exec rubocop
exit 0
