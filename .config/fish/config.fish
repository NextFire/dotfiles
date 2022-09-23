if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Java
#set -x JAVA_HOME (/usr/libexec/java_home)

# VSCode Terminal Shell Integration
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)
