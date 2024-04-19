SPACESHIP_GIT_EMAIL_COLOR="${SPACESHIP_GIT_EMAIL_COLOR="red"}"
SPACESHIP_GIT_EMAIL_PREFIX="${SPACESHIP_GIT_EMAIL_PREFIX="with "}"
SPACESHIP_GIT_EMAIL_SUFFIX="${SPACESHIP_GIT_EMAIL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_EMAIL_SYMBOL="${SPACESHIP_GIT_EMAIL_SYMBOL="📧 "}"
SPACESHIP_GIT_NAME_COLOR="${SPACESHIP_GIT_NAME_COLOR="red"}"
SPACESHIP_GIT_NAME_PREFIX="${SPACESHIP_GIT_NAME_PREFIX="as "}"
SPACESHIP_GIT_NAME_SUFFIX="${SPACESHIP_GIT_NAME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_NAME_SYMBOL="${SPACESHIP_GIT_NAME_SYMBOL="👤 "}"
SPACESHIP_GIT_USER_INDICATION="${SPACESHIP_GIT_USER_INDICATION="short"}"
SPACESHIP_GIT_USER_SHOW="${SPACESHIP_GIT_USER_SHOW="auto"}"

spaceship_git_user_name() {
  _spaceship_git_user \
    "name" \
    "${SPACESHIP_GIT_NAME_SYMBOL}" \
    "${SPACESHIP_GIT_NAME_PREFIX}" \
    "${SPACESHIP_GIT_NAME_SUFFIX}" \
    "${SPACESHIP_GIT_NAME_COLOR}" \
    "long_name"
}

spaceship_git_user_email() {
  _spaceship_git_user \
    "email" \
    "${SPACESHIP_GIT_EMAIL_SYMBOL}" \
    "${SPACESHIP_GIT_EMAIL_PREFIX}" \
    "${SPACESHIP_GIT_EMAIL_SUFFIX}" \
    "${SPACESHIP_GIT_EMAIL_COLOR}" \
    "long_email"
}

_spaceship_git_user() {
  property="${1}"
  symbol="${2}"
  prefix="${3}"
  suffix="${4}"
  color="${5}"
  long_value="${6}"

  [ "${SPACESHIP_GIT_USER_SHOW}" = "never" ] && return
  [[ $SPACESHIP_GIT_USER_SHOW == false ]] && return
  spaceship::is_git || return

  local text="$(git config user.${property})"

  if [ -z "${text}" ]; then
    return;
  fi

  if [ "${SPACESHIP_GIT_USER_SHOW}" = "auto" ] || [ "${SPACESHIP_GIT_USER_SHOW}" = "auto_${property}" ] ; then
    if [ "${text}" = "$(git config --global user.${property})" ]; then
      return;
    fi
  fi

  if [ "${SPACESHIP_GIT_USER_INDICATION}" != "long" ] && [ "${SPACESHIP_GIT_USER_INDICATION}" != "${long_value}" ]; then
    text=""
  fi

  spaceship::section::v4 \
    --color "${color}" \
    --prefix "${prefix}" \
    --suffix "${suffix}" \
    --symbol "${symbol}" \
    "${text} "
}
