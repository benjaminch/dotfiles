#! /bin/bash

# Install Oh My Zsh!
# https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make sure clipboard works in TMUX / VIM
brew install reattach-to-user-namespace
