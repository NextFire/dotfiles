if status is-interactive
    # Commands to run in interactive sessions can go here
end

# abbr
abbr -a venv 'python3 -m venv .venv'
abbr -a jotta 'rclone nfsmount jotta-crypt: ~/rclone --vfs-cache-mode writes --daemon'
abbr -a sd 'rclone nfsmount steamdeck:/run/media/mmcblk0p1 ~/rclone --vfs-cache-mode writes'
abbr -a mpvtct 'mpv --vo=tct --profile=sw-fast --vo-tct-algo=plain --vo-tct-256=yes --really-quiet'
abbr -a k kubectl
abbr -a kt 'kubectl -n kubernetes-dashboard create token admin-user | pbcopy'
abbr -a kp 'kubectl get pods -A -o wide -w'
abbr -a kn 'kubectl get nodes -o wide -w'
abbr -a kd 'kubectl drain --ignore-daemonsets --delete-emptydir-data' 

# Language
set -x LANG en_US.UTF-8
# Editor
set -x EDITOR 'code --wait'
# Java
#set -x JAVA_HOME (/usr/libexec/java_home)
# Go
set -x GOPATH ~/.go

# Rancher Desktop
fish_add_path -aP ~/.rd/bin
