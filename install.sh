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
brew_packages=(
    fish
    git
    gh
    git-delta
    git-lfs
    lazygit
    starship
    eza
    stow
    bat
    fzf
    ripgrep
    fd
    zoxide
    neovim
    btop
    moreutils
    fnm
    glow
    zellij
    ack
    ctop
    exiftool
    tlrc
    yq
    # yazi + previewer deps
    yazi
    ffmpeg
    sevenzip
    jq
    poppler
    imagemagick
    hexyl
)
installed_formulae="$(brew list --formula -1 2>/dev/null || true)"
to_install=()
for pkg in "${brew_packages[@]}"; do
    grep -qx "$pkg" <<<"$installed_formulae" || to_install+=("$pkg")
done
if [ ${#to_install[@]} -gt 0 ]; then
    log "Installing brew formulae: ${to_install[*]}"
    brew install "${to_install[@]}"
else
    log "All brew formulae already installed — skipping"
fi

# --- Brew casks --------------------------------------------------------------
brew_casks=(
    kitty
    ghostty
    1password-cli
    corretto@25
    raycast
    pearcleaner
    flux-app
    font-jetbrains-mono-nerd-font
    font-victor-mono-nerd-font
    font-im-writing-nerd-font
    font-maple-mono-nf
    font-symbols-only-nerd-font
)
installed_casks="$(brew list --cask -1 2>/dev/null || true)"
to_install=()
for cask in "${brew_casks[@]}"; do
    grep -qx "$cask" <<<"$installed_casks" || to_install+=("$cask")
done
if [ ${#to_install[@]} -gt 0 ]; then
    log "Installing brew casks: ${to_install[*]}"
    brew install --cask "${to_install[@]}"
else
    log "All brew casks already installed — skipping"
fi

# --- Yazi packs --------------------------------------------------------------
yazi_package_toml="$HOME/.config/yazi/package.toml"
yazi_has_pack() {
    [ -f "$yazi_package_toml" ] && grep -qF "\"$1\"" "$yazi_package_toml"
}
if command -v ya >/dev/null 2>&1; then
    for pack in \
        Reledia/glow \
        yazi-rs/flavors:catppuccin-mocha \
        gosxrgxx/flexoki-dark
    do
        if yazi_has_pack "$pack"; then
            log "yazi pack '$pack' already installed — skipping"
        else
            log "Installing yazi pack '$pack'"
            ya pack -a "$pack" || warn "yazi pack '$pack' failed"
        fi
    done
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

# --- Default shell -----------------------------------------------------------
fish_path="$(command -v fish || true)"
if [ -z "$fish_path" ]; then
    warn "fish not on PATH — skipping default shell setup"
elif [ "${SHELL:-}" = "$fish_path" ]; then
    log "fish is already the default shell — skipping"
else
    log "Setting fish as default shell"
    if ! grep -qxF "$fish_path" /etc/shells; then
        echo "$fish_path" | sudo tee -a /etc/shells >/dev/null
    fi
    chsh -s "$fish_path"
fi

log "Done."
