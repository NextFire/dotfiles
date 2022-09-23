function history-backup --wraps='rclone copyto $HOME/.local/share/fish/fish_history jotta-crypt:local_secrets/(python3 -c "import socket; print(socket.gethostname())")/fish_history -P' --description 'alias history-backup=rclone copyto $HOME/.local/share/fish/fish_history jotta-crypt:local_secrets/(python3 -c "import socket; print(socket.gethostname())")/fish_history -P'
  rclone copyto $HOME/.local/share/fish/fish_history jotta-crypt:local_secrets/(python3 -c "import socket; print(socket.gethostname())")/fish_history -P $argv; 
end
