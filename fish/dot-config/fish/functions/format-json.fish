function format-json
    argparse e/edit -- $argv
    or return 1

    if test (count $argv) -lt 1
        echo "Usage: format_json [-e|--edit] <filename>"
        return 1
    end

    set file $argv[1]

    if test -f "$file"
        jq . "$file" | sponge "$file"
        echo "Formatted: $file"

        # Open in editor if -e or --edit was provided
        if set -q _flag_e
            $EDITOR "$file"
        end
    else
        echo "Error: File '$file' not found."
        return 1
    end
end
