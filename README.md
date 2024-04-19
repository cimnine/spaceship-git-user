# spaceship-git-user

![Preview of the plugin](todo)

A [Spaceship Prompt Section][spaceship-prompt] plugin that shows the current git user name and email.
By default, they are only shown if the local setting (`git config user.name`) differs from the global setting (`git config --global user.name`).

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

Or if you defined [an explicit promp order][spaceship-prompt-order]:

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

### SPACESHIP_GIT_USER_PREFIX

```sh
SPACESHIP_GIT_USER_PREFIX="as "
```

### SPACESHIP_GIT_USER_SYMBOL

```sh
SPACESHIP_GIT_USER_SYMBOL="♔ "
```

### SPACESHIP_GIT_EMAIL_SYMBOL

```sh
SPACESHIP_GIT_EMAIL_SYMBOL="✉︎ "
```

### SPACESHIP_GIT_USER_COLOR

```sh
SPACESHIP_GIT_USER_COLOR="red"
```

### SPACESHIP_GIT_NAME_SHOW

```sh
# Only show the sections in which the global value is different from the local one.
# Default behavior.
SPACESHIP_GIT_NAME_SHOW="auto"

# Only show the name section when the global user.name value is different from the local one.
SPACESHIP_GIT_NAME_SHOW="auto_name"

# Only show the email section when the global user.email value is different from the local one.
SPACESHIP_GIT_NAME_SHOW="auto_email"

# Always show user.name and user.email section
SPACESHIP_GIT_NAME_SHOW="always"

# Never show them (this might be useful if you use direnv)
SPACESHIP_GIT_NAME_SHOW="never"
```

### SPACESHIP_GIT_NAME_INDICATION

```sh
# Only show the icons, not the actual values.
# Default
SPACESHIP_GIT_NAME_INDICATION="short"

# Show the full values.
SPACESHIP_GIT_NAME_INDICATION="long"

# Show the full name, but not the full email.
SPACESHIP_GIT_NAME_INDICATION="long_name"

# Show the full email, but not the full name.
SPACESHIP_GIT_NAME_INDICATION="long_email"
```
