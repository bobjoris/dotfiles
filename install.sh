/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages
brew install fish
brew install git
brew install gh
brew install git-delta
brew install starship
brew install exa
brew install stow
brew install bat
brew install fzf
brew install ripgrep
brew install fd
brew install zoxide
brew install neovim
brew install tmux
brew install btop
brew install yazi ffmpeg sevenzip jq poppler imagemagick font-symbols-only-nerd-font
brew install sponge

# Cask formula
brew install --cask kitty
brew install --cask raycast
brew install --cask pearcleaner

# Fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-victor-mono-nerd-font
brew install --cask font-im-writing-nerd-font

ya pack -a Reledia/glow
ya pack -a yazi-rs/flavors:catppuccin-moch
ya pack -a gosxrgxx/flexoki-dark

stow --dotfiles */
