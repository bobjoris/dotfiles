set fish_greeting ""

set -gx LANG en_GB.UTF-8
set -gx EDITOR nvim
set -gx MANPAGER "nvim +Man!"
set -gx STARSHIP_LOG error
set -gx DOCKER_HOST unix://$HOME/.docker/run/docker.sock
set -gx BUN_INSTALL "$HOME/.bun"
if test -x /usr/libexec/java_home
    set -l java_home (/usr/libexec/java_home -v 25 2>/dev/null)
    test -n "$java_home" && set -gx JAVA_HOME $java_home
end

fish_add_path ~/bin ~/.local/bin /usr/local/bin /opt/homebrew/bin /opt/homebrew/opt ~/.cargo/bin $BUN_INSTALL/bin

if type -q eza
    alias ls="eza --icons"
    alias la="eza --long --all --group --icons"
    alias lt="eza --tree --level=2 --long --icons"
    alias ltt="eza --tree --level=3 --long --icons"
    alias ll="eza -l -g --icons"
end

command -q btop && alias top btop
command -q nvim && alias vim nvim

alias cdd="cd ~/Dev && cd (eza | fzf)"
alias cat='bat'
alias preview="fzf --preview 'bat --color \"always\" --line-range=:500 {}'"

alias lg='lazygit'
alias json='jq'
alias mdc="$HOME/Dev/MiddayCommander/mdc"

abbr -a j18 j 18
abbr -a j21 j 21
abbr -a j25 j 25

if status is-interactive
    functions -q fzf_configure_bindings && fzf_configure_bindings --directory=\cf --variables=\e\cv

    command -q op && op completion fish | source
    command -q zoxide && zoxide init fish | source
    command -q fnm && fnm env --use-on-cd --shell fish | source
    if command -q starship
        starship init fish | source
        functions -q enable_transience && enable_transience
    end

    command -q gradle-gh-env && gradle-gh-env
end
