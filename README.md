# spaceship-git-user

![Preview of the plugin](https://github.com/cimnine/spaceship-git-user/assets/804532/ab93b25c-7014-44b7-a01e-94a5624cd94f)

A [Spaceship Prompt Section][spaceship-prompt] plugin that shows the current git username and email.
By default, they are only shown if the local setting (`git config --local user.name`) differs from the default setting (`git config user.name`).

This is a fork of [`git-name` by hexcowboy][original].

[spaceship-prompt]: https://github.com/denysdovhan/spaceship-prompt
[original]: https://github.com/hexcowboy/spaceship-git-name

## Requirements

- [Zsh](https://github.com/zsh-users/zsh) installed and used as primary shell
- [Spaceship Prompt](https://github.com/denysdovhan/spaceship-prompt)
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## Installation

### Manually

To install this plugin you need to source it from your `.zshrc`

1. Save `spaceship-git-user.zsh` to your home folder (`~`)
2. In your `.zshrc`, source the plugin before you initialize spaceship. You can rename the file to anything you want.

```sh
. ~/spaceship-git-user.zsh # <------ Add this line before the following!
autoload -U promptinit; promptinit
prompt spaceship
```

### Zgen

```sh
zgen load cimnine/spaceship-git-user spaceship-git-user.zsh main # <------ must be before loading spaceship!
zgen load spaceship-prompt/spaceship-prompt spaceship
```

## Setup

Add `git_user` to your prompt.

```sh
# .zshrc or .spaceshiprc.zsh

spaceship add --before git git_user_name
spaceship add --after git_user_name git_user_email
```

Or if you defined [an explicit prompt order][spaceship-prompt-order]:

[spaceship-prompt-order]: https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#order

```sh
# .zshrc or .spaceshiprc.zsh

SPACESHIP_PROMPT_ORDER=(
  # possibly other sections
  git
  git_user_name
  git_user_email
  # possibly other sections
)
```

You can also add this section to the right prompt:

```sh
# .zshrc or .spaceshiprc.zsh

SPACESHIP_RPROMPT_ORDER=(
  # possibly other sections
  git_user_name
  git_user_email
  # possibly other sections
)
```

## Configuration

Use the following variables to change the behavior of the section.

### SPACESHIP_GIT_x_PREFIX

```sh
SPACESHIP_GIT_EMAIL_PREFIX="with "
SPACESHIP_GIT_USER_PREFIX="as "
```

### SPACESHIP_GIT_x_SYMBOL

```sh
SPACESHIP_GIT_EMAIL_SYMBOL="📧 "
SPACESHIP_GIT_USER_SYMBOL="👤 "
```

### SPACESHIP_GIT_x_COLOR

```sh
SPACESHIP_GIT_EMAIL_COLOR="red"
SPACESHIP_GIT_USER_COLOR="red"
```

### SPACESHIP_GIT_x_SHOW

```sh
# Only show the section when the default value is different from the local one.
# Default behavior.
SPACESHIP_GIT_EMAIL_SHOW="auto"
SPACESHIP_GIT_NAME_SHOW="auto"

# Always show the section
SPACESHIP_GIT_EMAIL_SHOW="always"
SPACESHIP_GIT_NAME_SHOW="always"

# Never show the section (this might be useful if you use direnv)
SPACESHIP_GIT_EMAIL_SHOW="never"
SPACESHIP_GIT_NAME_SHOW="never"

# alternative to "never"
SPACESHIP_GIT_EMAIL_SHOW=false
SPACESHIP_GIT_NAME_SHOW=false
```

### SPACESHIP_GIT_x_INDICATION

```sh
# Only show the icon, not the actual value.
# Default behavior.
SPACESHIP_GIT_EMAIL_INDICATION="short"
SPACESHIP_GIT_NAME_INDICATION="short"

# Show the full value.
SPACESHIP_GIT_EMAIL_INDICATION="long"
SPACESHIP_GIT_NAME_INDICATION="long"
```

### SPACESHIP_GIT_EMAIL_PART

```sh
# Show the full git email address, for example 'user@domain.tld'.
# Default behavior.
SPACESHIP_GIT_EMAIL_PART="full"

# Only show the part before the last '@', for example 'user'.
SPACESHIP_GIT_EMAIL_PART="user"

# Only show the part after the last '@', for example 'domain.tld'.
SPACESHIP_GIT_EMAIL_PART="domain"
```

### SPACESHIP_GIT_EMAIL_PART_AFFIX

```sh
# Results in "user@…"
# Default behavior.
SPACESHIP_GIT_EMAIL_PART="user"
SPACESHIP_GIT_EMAIL_PART_AFFIX="auto"

# Results in "…@domain.tld"
# Default behavior.
SPACESHIP_GIT_EMAIL_PART="domain"
SPACESHIP_GIT_EMAIL_PART_AFFIX="auto"

# Results in "user@"
SPACESHIP_GIT_EMAIL_PART="user"
SPACESHIP_GIT_EMAIL_PART_AFFIX="@"

# Results in "@domain.tld"
SPACESHIP_GIT_EMAIL_PART="domain"
SPACESHIP_GIT_EMAIL_PART_AFFIX="@"

# Results in "user"
SPACESHIP_GIT_EMAIL_PART="user"
SPACESHIP_GIT_EMAIL_PART_AFFIX=""

# Results in "domain.tld"
SPACESHIP_GIT_EMAIL_PART="domain"
SPACESHIP_GIT_EMAIL_PART_AFFIX=""
```
