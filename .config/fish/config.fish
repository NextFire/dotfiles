if status is-interactive
    # Commands to run in interactive sessions can go here
end

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# VSCode Terminal Shell Integration
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)
