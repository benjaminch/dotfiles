#! /bin/bash

# Install Oh My Zsh!
# https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# TERMINAL

# Install WezTerm
cp .wezterm.lua ~/.wezterm.lua 
brew install --cask wezterm

# Install tmux
cp .tmux ~/
brew install tmux

# Make sure clipboard works in TMUX / VIM
brew install reattach-to-user-namespace

# Install better command history (atuin)
cp ./.config/atuin ~/.config/atuin
brew install atuin



# TILING MANAGER

# Install Yabai (tiling manager)
cp ./.config/yabai ~/.config/yabai
brew install koekeishiya/formulae/yabai

# Install skhd (keyboard shortcut manager)
cp ./.config/skhd ~/.config/skhd
brew install koekeishiya/formulae/skhd



# TEXT EDITOR
brew install fzf

# Neovim
# cp ./.config/nvim ~/.config/nvim
# brew install neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git


# DEV
brew install llvm

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer

# Go
brew install go



# OPS

# Install Docker
brew install docker

# Install Terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"

# Install Kubernetes management tool (k9s)
cp ./.config/k9s ~/.config/k9s
brew install derailed/k9s/k9s

# Install kubectl extensions (kubectl view allocation)
cargo install kubectl-view-allocations
