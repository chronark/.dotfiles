# Dotfiles

My personal development environment configuration, managed with GNU Stow.

## Quick Start

```bash
git clone git@github.com:chronark/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install
```

## Structure

```
~/.dotfiles/
├── home/           # Dotfiles (symlinked to ~)
│   ├── .zshrc
│   └── .config/
│       ├── starship.toml
│       ├── zed/
│       ├── ghostty/
│       └── nvim/
├── Brewfile        # Homebrew packages
└── Makefile
```

## Commands

| Command | Description |
|---------|-------------|
| `make install` | Full setup (brew + stow) |
| `make brew` | Install Homebrew packages |
| `make stow` | Create symlinks |
| `make unstow` | Remove symlinks |
| `make update` | Pull changes + upgrade + re-stow |
| `make doctor` | Check symlinks and packages |

## New Machine Setup

```bash
# Install Homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone and install
git clone git@github.com:chronark/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install
```
