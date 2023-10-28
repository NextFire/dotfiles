if status is-interactive
    # Commands to run in interactive sessions can go here
end

# abbr
abbr -a venv 'python3 -m venv --upgrade-deps .venv'
abbr -a jotta 'rclone mount jotta-crypt: ~/rclone --vfs-cache-mode writes --daemon'
abbr -a deck 'rclone mount steamdeck:/run/media/mmcblk0p1 ~/rclone --vfs-cache-mode writes'
abbr -a mpvtct 'mpv --vo=tct --profile=sw-fast --vo-tct-algo=plain --vo-tct-256=yes --really-quiet'
abbr -a k kubectl
abbr -a kt 'kubectl -n kubernetes-dashboard create token admin-user | pbcopy'
abbr -a kp 'kubectl get pods -A -o wide -w'
abbr -a kd 'kubectl drain --ignore-daemonsets --delete-emptydir-data' 

# Language
#set -x LANG en_US.UTF-8

# Editor
set -x EDITOR 'code --wait'

# Java
#set -x JAVA_HOME (/usr/libexec/java_home)
