# python
abbr -a uvp 'uv pip'
abbr -a uvv 'uv venv'
abbr -a uva 'source .venv/bin/activate.fish'

# kubectl
abbr -a k kubectl
abbr -a kt 'kubectl -n kube-dashboard create token admin-user | pbcopy'
abbr -a kn 'kubectl get nodes -o wide -w'
abbr -a kp 'kubectl get pods -A -o wide -w'
abbr -a kf 'kubectl delete pod --field-selector="status.phase==Failed" -A'
abbr -a kd 'kubectl drain --ignore-daemonsets --delete-emptydir-data'

# rclone
abbr -a jotta 'rclone mount jotta-crypt: ~/rclone --vfs-cache-mode writes --daemon'
abbr -a sd 'rclone mount steamdeck:/run/media/mmcblk0p1 ~/rclone --vfs-cache-mode writes'

# others
abbr -a mpvtct 'mpv --vo=tct --profile=sw-fast --vo-tct-algo=plain --vo-tct-256=yes --really-quiet'

# fzf
fzf --fish | source
