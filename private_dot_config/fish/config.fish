if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a uvp 'uv pip'
abbr -a uvv 'uv venv'
abbr -a activate 'source .venv/bin/activate.fish'

abbr -a k kubectl
abbr -a kt 'kubectl -n kube-dashboard create token admin-user | pbcopy'
abbr -a kn 'kubectl get nodes -o wide -w'
abbr -a kp 'kubectl get pods -A -o wide -w'
abbr -a kf 'kubectl delete pod --field-selector="status.phase==Failed" -A'
abbr -a kd 'kubectl drain --ignore-daemonsets --delete-emptydir-data'

abbr -a mpvtct 'mpv --vo=tct --profile=sw-fast --vo-tct-algo=plain --vo-tct-256=yes --really-quiet'

abbr -a jotta 'rclone mount jotta-crypt: ~/rclone --vfs-cache-mode writes --daemon'
abbr -a sd 'rclone mount steamdeck:/run/media/mmcblk0p1 ~/rclone --vfs-cache-mode writes'

set -x GOPATH ~/.go
#set -x JAVA_HOME (/usr/libexec/java_home)

fish_add_path -P ~/.local/bin ~/.krew/bin ~/.cargo/bin
fish_add_path -aP ~/.rd/bin
