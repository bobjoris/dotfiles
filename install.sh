#!/usr/bin/env bash
set -euo pipefail

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!!\033[0m  %s\n' "$*" >&2; }
die()  { printf '\033[1;31mxx\033[0m  %s\n' "$*" >&2; exit 1; }

# --- Homebrew ----------------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    log "Homebrew already installed — skipping"
fi

# --- Brew formulae -----------------------------------------------------------
log "Installing brew formulae"
brew_packages=(
    fish
    git
    gh
    git-delta
    starship
    eza
    stow
    bat
    fzf
    ripgrep
    fd
    zoxide
    neovim
    tmux
    btop
    sponge
    fnm
    # yazi + previewer deps
    yazi
    ffmpeg
    sevenzip
    jq
    poppler
    imagemagick
    font-symbols-only-nerd-font
)
brew install "${brew_packages[@]}"

# --- Brew casks --------------------------------------------------------------
log "Installing brew casks"
brew_casks=(
    kitty
    raycast
    pearcleaner
    font-jetbrains-mono-nerd-font
    font-victor-mono-nerd-font
    font-im-writing-nerd-font
    font-maple-mono-nf
)
brew install --cask "${brew_casks[@]}"

# --- Yazi packs --------------------------------------------------------------
if command -v ya >/dev/null 2>&1; then
    log "Installing yazi packs"
    ya pack -a Reledia/glow            || warn "yazi pack 'glow' failed"
    ya pack -a yazi-rs/flavors:catppuccin-mocha || warn "yazi pack 'catppuccin-mocha' failed"
    ya pack -a gosxrgxx/flexoki-dark   || warn "yazi pack 'flexoki-dark' failed"
else
    warn "yazi (ya) not on PATH — skipping yazi packs"
fi

# --- Stow --------------------------------------------------------------------
if ! command -v stow >/dev/null 2>&1; then
    die "stow is not installed (expected after brew step)"
fi
log "Stowing dotfiles"
cd "$(dirname "$0")"
stow --dotfiles */

log "Done."
