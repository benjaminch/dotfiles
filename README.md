# 🏠 Dotfiles

Personal dotfiles managed with [dotter](https://github.com/SuperCuber/dotter).

## 📦 What's Included

### Terminal & Shell
- **Shell**: [zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/)
- **Terminal**: [Ghostty](https://ghostty.org/)
- **Terminal Multiplexer**: [Zellij](https://zellij.dev/)
- **Prompt**: [Starship](https://starship.rs/)
- **History**: [Atuin](https://atuin.sh/) - magical shell history

### Development Tools
- **Editor**: [Neovim](https://neovim.io/) with [LazyVim](https://www.lazyvim.org/)
- **Git UI**: [Lazygit](https://github.com/jesseduffield/lazygit)
- **Kubernetes**: [k9s](https://k9scli.io/)

### Modern CLI Replacements
- `bat` - better `cat`
- `eza` - better `ls`
- `ripgrep` (rg) - better `grep`
- `fd` - better `find`
- `dust` - better `du`
- `broot` - better `tree`
- `zoxide` - smarter `cd`
- `fzf` - fuzzy finder
- `fpp` - Facebook PathPicker
- `sobriquet` - fuzzy finder for shell aliases

### Window Management
- **Tiling Manager**: [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- **Hotkeys**: [skhd](https://github.com/koekeishiya/skhd)

## 🚀 Installation

### Prerequisites

1. Install [Homebrew](https://brew.sh/):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Clone this repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/Code/dotfiles
cd ~/Code/dotfiles
```

### Quick Setup

Run the automated setup script:
```bash
./setup.sh
```

This will install:
- Oh My Zsh
- Ghostty terminal
- Dotter (dotfile manager)
- Zellij
- Atuin
- AeroSpace & skhd
- All modern CLI tools (including sobriquet)
- Development tools (Neovim, Rust, Go, etc.)

### Deploy Dotfiles

After installation, deploy your dotfiles:
```bash
cd ~/Code/dotfiles
dotter deploy
```

### Post-Installation

1. **Configure Git user**:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

2. **Restart your shell**:
```bash
exec zsh
```

3. **Install LazyVim plugins** (first time opening nvim):
```bash
nvim
# LazyVim will automatically install plugins
```

## 🎨 Customization

### Adding New Dotfiles

1. Add your config file/directory to `~/Code/dotfiles/`
2. Update `.dotter/global.toml` to include the new file:
```toml
[default.files]
your-config = "~/.config/your-app"
```
3. Deploy: `dotter deploy`

### Private Configuration

For files containing secrets (like `zshrc_qovery_aliases`), keep them in `~/` but don't add them to the dotfiles repo. The zshrc is configured to source them conditionally.

## 📁 Structure

```
dotfiles/
├── .dotter/          # Dotter configuration
├── nvim/             # Neovim configuration (LazyVim)
├── ghostty/          # Ghostty terminal config
├── zellij/           # Zellij config
├── k9s/              # Kubernetes k9s config
├── lazygit/          # Lazygit config
├── aerospace         # AeroSpace tiling manager config
├── gitconfig         # Git configuration
├── gitignore_global  # Global gitignore
├── starship.toml     # Starship prompt config
├── zshrc             # Zsh configuration
├── zshrc_aliases     # Shell aliases
├── zshenv            # Environment variables
└── setup.sh          # Installation script
```

## ⚡ Key Features

### Zoxide (Smart Directory Jumping)
```bash
z dotf         # Jump to ~/Code/dotfiles
zi             # Interactive directory picker
cd projects    # Also uses zoxide (aliased)
```

### Git Aliases
```bash
git st         # status
git co         # checkout
git cm         # commit -m
git lg         # beautiful log graph
git cleanup    # remove merged branches
```

### Neovim (LazyVim)
- LSP support for Rust, Go, JSON, etc.
- Debugger integration (DAP)
- Testing integration (Neotest)
- **Note**: Copilot is currently disabled due to LSP update issues

## 🔧 Troubleshooting

### Dotter Conflicts
If dotter reports conflicts with existing files:
```bash
# Force overwrite (use with caution)
dotter deploy --force

# Or manually remove conflicting files
rm ~/.config/conflicting-file
dotter deploy
```

### Symlink Issues
Check symlinks are pointing to the right place:
```bash
ls -la ~/.config/nvim
```

### Reload Configuration
After making changes:
```bash
# Reload shell
source ~/.zshrc

# Or restart shell
exec zsh
```

## 📝 Notes

- Starship config path is `~/.config/starship.toml`
- Global gitignore includes `.DS_Store`, `.env`, and common OS/IDE files
- Zsh is optimized to avoid duplicate sourcing and includes conditional loading
- Google Cloud SDK and other tools are loaded conditionally (only if installed)

## 🔗 Links

- [Dotter Documentation](https://github.com/SuperCuber/dotter)
- [LazyVim Documentation](https://www.lazyvim.org/)
- [Starship Configuration](https://starship.rs/config/)
- [Zoxide GitHub](https://github.com/ajeetdsouza/zoxide)

## 📄 License

MIT License - See LICENSE file for details
