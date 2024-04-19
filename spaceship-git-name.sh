#!/bin/zsh

SPACESHIP_GIT_USER_PREFIX="${SPACESHIP_GIT_USER_PREFIX="as "}"
SPACESHIP_GIT_USER_SYMBOL="${SPACESHIP_GIT_USER_SYMBOL="♔ "}"
SPACESHIP_GIT_EMAIL_SYMBOL="${SPACESHIP_GIT_EMAIL_SYMBOL="✉︎ "}"
SPACESHIP_GIT_USER_COLOR="${SPACESHIP_GIT_USER_COLOR="red"}"
SPACESHIP_GIT_NAME_SHOW="${SPACESHIP_GIT_NAME_SHOW="auto"}"
SPACESHIP_GIT_NAME_INDICATION="${SPACESHIP_GIT_NAME_INDICATION="short"}"

spaceship_git_user() {
  spaceship::is_git || return
  [ "${SPACESHIP_GIT_NAME_SHOW}" = "never" ] && return

  local section=""
  local username="$(git config user.name)"
  local email="$(git config user.email)"

  if [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto" ] || [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto_name" ] ; then
    if [ "${username}" = "$(git config --global user.name)" ]; then
      unset username
    fi
  fi

  if [ -n "${username}" ]; then
    if [ "${SPACESHIP_GIT_NAME_INDICATION}" = "long" ] || [ "${SPACESHIP_GIT_NAME_INDICATION}" = "long_name" ] ; then
      section+="${SPACESHIP_GIT_USER_SYMBOL}${username} "
    else
      section+="${SPACESHIP_GIT_USER_SYMBOL}"
    fi
  fi

  if [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto" ] || [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto_email" ] ; then
    if [ "${email}" = "$(git config --global user.email)" ]; then
      unset email
    fi
  fi

  if [ -n "${email}" ]; then
    if [ "${SPACESHIP_GIT_NAME_INDICATION}" = "long" ] || [ "${SPACESHIP_GIT_NAME_INDICATION}" = "long_name" ] ; then
      section+="${SPACESHIP_GIT_EMAIL_SYMBOL}${email} "
    else
      section+="${SPACESHIP_GIT_EMAIL_SYMBOL}"
    fi

  fi

  if [ -n "${section}" ]; then
    spaceship::section \
      "${SPACESHIP_GIT_USER_COLOR}" \
      "${SPACESHIP_GIT_USER_PREFIX}" \
      "${section}"
  fi
}
