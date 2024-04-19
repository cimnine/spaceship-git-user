#!/bin/zsh

SPACESHIP_GIT_USER_PREFIX="${SPACESHIP_GIT_USER_PREFIX="as "}"
SPACESHIP_GIT_USER_SUFFIX="${SPACESHIP_GIT_USER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_USER_SYMBOL="${SPACESHIP_GIT_USER_SYMBOL="♔ "}"
SPACESHIP_GIT_EMAIL_SYMBOL="${SPACESHIP_GIT_EMAIL_SYMBOL="✉︎ "}"
SPACESHIP_GIT_USER_COLOR="${SPACESHIP_GIT_USER_COLOR="red"}"
SPACESHIP_GIT_NAME_SHOW="${SPACESHIP_GIT_NAME_SHOW="auto"}"
SPACESHIP_GIT_NAME_INDICATION="${SPACESHIP_GIT_NAME_INDICATION="short"}"

spaceship_git_user_name() {
  _spaceship_git_user "name" "${SPACESHIP_GIT_USER_SYMBOL}"
}

spaceship_git_user_email() {
  _spaceship_git_user "email" "${SPACESHIP_GIT_EMAIL_SYMBOL}"
}

_spaceship_git_user() {
  property="${1}"
  symbol="${2}"

  [ "${SPACESHIP_GIT_NAME_SHOW}" = "never" ] && return
  [[ $SPACESHIP_GIT_NAME_SHOW == false ]] && return
  spaceship::is_git || return

  local text="$(git config user.${property})"

  if [ -z "${text}" ]; then
    return;
  fi

  if [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto" ] || [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto_${property}" ] ; then
    if [ "${text}" = "$(git config --global user.${property})" ]; then
      return;
    fi
  fi

  if [ "${SPACESHIP_GIT_NAME_INDICATION}" = "short" ]; then
    text=""
  fi

  spaceship::section::v4 \
    --color "${SPACESHIP_GIT_USER_COLOR}" \
    --prefix "${SPACESHIP_GIT_USER_PREFIX}" \
    --suffix "${SPACESHIP_GIT_USER_SUFFIX}" \
    --symbol "${symbol}" \
    "${text}"
}
