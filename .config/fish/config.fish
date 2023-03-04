if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Language
set -x LANG en_US.UTF-8

# Editor
set -x EDITOR 'code --wait'

# Java
#set -x JAVA_HOME (/usr/libexec/java_home)

# VSCode Terminal Shell Integration
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)
