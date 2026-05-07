if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx LANG en_GB.UTF-8
set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/opt $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/.nvm/versions/node/v21.5.0/bin $PATH

if type -q eza
    alias ls="eza --icons"
    alias la="eza --long --all --group --icons"
    alias lt="eza --tree --level=2 --long --icons"
    alias ltt="eza --tree --level=3 --long --icons"
    alias ll="eza -l -g --icons"
end

command -qv btop && alias top btop

alias cdd="cd ~/Dev && cd (eza | fzf)"
alias cat='bat'
alias preview="fzf --preview 'bat --color \"always\" --line-range=:500 {}'"
command -qv nvim && alias vim nvim

alias lg='lazygit'
alias json='jq'
alias mdc='/Users/jorisg/Dev/MiddayCommander/mdc'

alias j18="set -x JAVA_HOME (/usr/libexec/java_home -v 18); java -version"
alias j21="set -x JAVA_HOME (/usr/libexec/java_home -v 21); java -version"
alias j25="set -x JAVA_HOME (/usr/libexec/java_home -v 25); java -version"

set -x JAVA_HOME (/usr/libexec/java_home -v 25)
export MANPAGER="nvim +Man!"

fzf_configure_bindings --directory=\cf --variables=\e\cv

op completion fish | source
zoxide init fish | source
fnm env --use-on-cd --shell fish | source

set -gx STARSHIP_LOG error

export DOCKER_HOST=unix://$HOME/.docker/run/docker.sock
starship init fish | source
enable_transience

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
