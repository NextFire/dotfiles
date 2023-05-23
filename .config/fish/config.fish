if status is-interactive
    # Commands to run in interactive sessions can go here
end

# abbr
abbr -a venv 'python3 -m venv .venv'
abbr -a jotta 'rclone mount jotta-crypt: ~/rclone --vfs-cache-mode full --daemon'
abbr -a mpvtct 'mpv --vo=tct --profile=sw-fast --vo-tct-algo=plain --vo-tct-256=yes --really-quiet'
abbr -a k kubectl
abbr -a kt 'kubectl -n kubernetes-dashboard create token admin-user | pbcopy'
abbr -a kp 'kubectl get pods -A -o wide -w'
abbr -a kd "kubectl drain --delete-emptydir-data --ignore-daemonsets --pod-selector='app!=csi-attacher,app!=csi-provisioner,app!=longhorn-admission-webhook,app!=longhorn-conversion-webhook,app!=longhorn-driver-deployer'"

# Language
#set -x LANG en_US.UTF-8

# Editor
set -x EDITOR 'code --wait'

# Java
#set -x JAVA_HOME (/usr/libexec/java_home)

# VSCode Terminal Shell Integration
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)
