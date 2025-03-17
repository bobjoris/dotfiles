if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

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

alias gbn='git --no-pager branch'
alias ghb='gh browse'
alias ghpr='gh pr view -w'
alias gpf='git push -f'
alias gaa='git add -A'
alias grm='git rebase master'
alias lg='lazygit'

alias json='jq'

alias j18="set -x JAVA_HOME (/usr/libexec/java_home -v 18); java -version"
alias j21="set -x JAVA_HOME (/usr/libexec/java_home -v 21); java -version"

export JAVA_HOME=$(/usr/libexec/java_home -v 21)

fzf_configure_bindings --directory=\cf --variables=\e\cv

op completion fish | source
zoxide init fish | source

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function format_json
    if test -z "$argv[1]"
        echo "Usage: format_json <filename> [-e|--edit]"
        return 1
    end

    set file $argv[1]
    set edit_mode 0

    # Check for edit flag
    if test (count $argv) -gt 1
        if test "$argv[2]" = "-e" -o "$argv[2]" = "--edit"
            set edit_mode 1
        end
    end

    if test -f "$file"
        jq . "$file" | sponge "$file"
        echo "Formatted: $file"

        # Open in Vim if edit mode is enabled
        if test $edit_mode -eq 1
            vim "$file"
        end
    else
        echo "Error: File '$file' not found."
        return 1
    end
end

function starship_transient_prompt_func
    starship module character
end

function starship_transient_rprompt_func
    starship module time
end

set -gx STARSHIP_LOG error

starship init fish | source
enable_transience
