#!/bin/zsh

SPACESHIP_GIT_USER_PREFIX="${SPACESHIP_GIT_USER_PREFIX="as "}"
SPACESHIP_GIT_USER_SYMBOL="${SPACESHIP_GIT_USER_SYMBOL="♔ "}"
SPACESHIP_GIT_EMAIL_SYMBOL="${SPACESHIP_GIT_EMAIL_SYMBOL="✉︎ "}"
SPACESHIP_GIT_USER_COLOR="${SPACESHIP_GIT_USER_COLOR="red"}"
SPACESHIP_GIT_NAME_SHOW="${SPACESHIP_GIT_NAME_SHOW="auto"}"

spaceship_git_user() {
  spaceship::is_git || return
  [ "${SPACESHIP_GIT_NAME_SHOW}" = "never" ] && return

  local section=""
  local username="$(git config user.name)"
  local email="$(git config user.email)"

  if [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto" ] || [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto_name" ] ; then
    local global_username="$(git config --global user.name)"
    if [ "${username}" != "${global_username}" ]; then
      username="${global_username}"
    else
      unset unsername
    fi
  fi

  if [ -n "${username}" ]; then
    section+="${SPACESHIP_GIT_USER_SYMBOL}${username} "
  fi

  if [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto" ] || [ "${SPACESHIP_GIT_NAME_SHOW}" = "auto_email" ] ; then
    local global_email="$(git config --global user.email)"
    if [ "${email}" != "${global_email}" ]; then
      email="${global_email}"
    else
      unset email
    fi
  fi

  if [ -n "${email}" ]; then
    section+="${SPACESHIP_GIT_EMAIL_SYMBOL}${email} "
  fi

  if [ -n "${section}" ]; then
    spaceship::section \
      "${SPACESHIP_GIT_USER_COLOR}" \
      "${SPACESHIP_GIT_USER_PREFIX}" \
      "${section}"
  fi
}
