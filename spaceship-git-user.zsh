
SPACESHIP_GIT_EMAIL_COLOR="${SPACESHIP_GIT_EMAIL_COLOR="red"}"
SPACESHIP_GIT_EMAIL_INDICATION="${SPACESHIP_GIT_EMAIL_INDICATION="short"}"
SPACESHIP_GIT_EMAIL_PREFIX="${SPACESHIP_GIT_EMAIL_PREFIX="with "}"
SPACESHIP_GIT_EMAIL_SHOW="${SPACESHIP_GIT_EMAIL_SHOW="auto"}"
SPACESHIP_GIT_EMAIL_SUFFIX="${SPACESHIP_GIT_EMAIL_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"}"
SPACESHIP_GIT_EMAIL_SYMBOL="${SPACESHIP_GIT_EMAIL_SYMBOL="📧 "}"
SPACESHIP_GIT_EMAIL_PART="${SPACESHIP_GIT_EMAIL_PART="full"}"
SPACESHIP_GIT_EMAIL_PART_AFFIX="${SPACESHIP_GIT_EMAIL_PART_AFFIX="auto"}"

SPACESHIP_GIT_NAME_COLOR="${SPACESHIP_GIT_NAME_COLOR="red"}"
SPACESHIP_GIT_NAME_INDICATION="${SPACESHIP_GIT_NAME_INDICATION="short"}"
SPACESHIP_GIT_NAME_PREFIX="${SPACESHIP_GIT_NAME_PREFIX="as "}"
SPACESHIP_GIT_NAME_SHOW="${SPACESHIP_GIT_NAME_SHOW="auto"}"
SPACESHIP_GIT_NAME_SUFFIX="${SPACESHIP_GIT_NAME_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"}"
SPACESHIP_GIT_NAME_SYMBOL="${SPACESHIP_GIT_NAME_SYMBOL="👤 "}"

spaceship_git_user_name() {
  _spaceship_git_user \
    "name" \
    "${SPACESHIP_GIT_NAME_SYMBOL}" \
    "${SPACESHIP_GIT_NAME_PREFIX}" \
    "${SPACESHIP_GIT_NAME_SUFFIX}" \
    "${SPACESHIP_GIT_NAME_COLOR}" \
    "${SPACESHIP_GIT_NAME_INDICATION}" \
    "${SPACESHIP_GIT_NAME_SHOW}"
}

spaceship_git_user_email() {
  _spaceship_git_user \
    "email" \
    "${SPACESHIP_GIT_EMAIL_SYMBOL}" \
    "${SPACESHIP_GIT_EMAIL_PREFIX}" \
    "${SPACESHIP_GIT_EMAIL_SUFFIX}" \
    "${SPACESHIP_GIT_EMAIL_COLOR}" \
    "${SPACESHIP_GIT_EMAIL_INDICATION}" \
    "${SPACESHIP_GIT_EMAIL_SHOW}"
}

_spaceship_git_user() {
  property="${1}"
  symbol="${2}"
  prefix="${3}"
  suffix="${4}"
  color="${5}"
  indication="${6}"
  show="${7}"

  [ "${SPACESHIP_GIT_USER_SHOW}" = "never" ] && return
  [[ $SPACESHIP_GIT_USER_SHOW == false ]] && return
  spaceship::is_git || return

  local text
  if [ "${show}" = "auto" ]; then
    text="$(git config --local user.${property})"
  else
    text="$(git config user.${property})"
  fi

  if [ -z "${text}" ]; then
    return;
  fi

  if [ "${indication}" = "short" ]; then
    text=""
  elif [ "${property}" = "email" ] && [ "${SPACESHIP_GIT_EMAIL_PART}" = "user" ]; then
    if [ "${SPACESHIP_GIT_EMAIL_PART_AFFIX}" = "auto" ]; then
      SPACESHIP_GIT_EMAIL_PART_AFFIX="@…"
    fi
    text="${text%%@*}${SPACESHIP_GIT_EMAIL_PART_AFFIX}"
  elif [ "${property}" = "email" ] && [ "${SPACESHIP_GIT_EMAIL_PART}" = "domain" ]; then
    if [ "${SPACESHIP_GIT_EMAIL_PART_AFFIX}" = "auto" ]; then
      SPACESHIP_GIT_EMAIL_PART_AFFIX="…@"
    fi
    text="${SPACESHIP_GIT_EMAIL_PART_AFFIX}${text#*@}"
  fi

  spaceship::section::v4 \
    --color "${color}" \
    --prefix "${prefix}" \
    --suffix "${suffix}" \
    --symbol "${symbol}" \
    "${text} "
}
