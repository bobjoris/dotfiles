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
brew install neovim
brew install tmux
brew install btop
brew install yazi
brew install zoxide

# Cask formula
brew install --cask kitty
brew install --cask raycast
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask pearcleaner

stow --dotfiles */
