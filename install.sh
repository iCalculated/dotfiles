#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "🔗 Linking dotfiles from $DOTFILES"

# Core dotfiles
ln -sf "$DOTFILES/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/.p10k.zsh" ~/.p10k.zsh
ln -sf "$DOTFILES/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/.vimrc" ~/.vimrc
ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf

# Starship config
mkdir -p ~/.config
ln -sf "$DOTFILES/starship.toml" ~/.config/starship.toml

# Aerospace (macOS tiling wm)
ln -sf "$DOTFILES/.aerospace.toml" ~/.aerospace.toml

# Neovim
mkdir -p ~/.config/nvim
ln -sf "$DOTFILES/init.vim" ~/.config/nvim/init.vim

echo "✅ Dotfiles linked"

# Install dependencies if brew is available
if command -v brew &> /dev/null; then
    read -p "📦 Install dependencies via Homebrew? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing..."
        brew install \
            powerlevel10k \
            zsh-syntax-highlighting \
            zsh-autosuggestions \
            starship \
            atuin \
            zoxide \
            fzf \
            eza \
            bat \
            git-delta \
            pyenv

        echo "✅ Dependencies installed"
    fi
else
    echo "⚠️  Homebrew not found. Install dependencies manually."
fi

echo ""
echo "🎉 Done! Open a new terminal to use your new config."
echo "   Run 'p10k configure' if you want to customize the prompt."
