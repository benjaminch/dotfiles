#! /bin/bash

# Install Oh My Zsh!
# https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# TERMINAL

# Install Ghostty
brew install --cask ghostty

# Install Dotter (dotfile manager)
brew install dotter

# Install zellij
brew install zellij

# Install better command history (atuin)
brew install atuin

# TILING MANAGER

# Install Aerospace (tiling manager)
brew install --cask nikitabobko/tap/aerospace

# Install skhd (keyboard shortcut manager)
brew install koekeishiya/formulae/skhd

# TOOLS
brew install bat     # better cat
brew install fzf     # files search
brew install ripgrep # better grep
brew install dust    # better du
brew install fd      # better find
brew install broot   # better tree
brew install zoxide  # better cd

# TEXT EDITOR (required for lazyvim)
pip install pynvim
brew install lynx
npm install -g neovim
npm install -g prettier
npm install -g markdownlint-cli2
npm install -g markdown-toc
brew install tectonic
brew install mactex
npm install -g @mermaid-js/mermaid-cli

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
brew install derailed/k9s/k9s

# Install kubectl extensions (kubectl view allocation)
cargo install kubectl-view-allocations
