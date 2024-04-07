function history-backup
    set hostname (python3 -c "import socket; print(socket.gethostname())")
    rclone copyto $HOME/.local/share/fish/fish_history jotta-crypt:local_secrets/$hostname/fish_history -P
end
