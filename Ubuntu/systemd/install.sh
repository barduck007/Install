
sudo ln -s $(pwd)/systemd/rclone-mount.service /etc/systemd/system/rclone-mount.service
# Active le service pour qu'il démarre au boot
sudo systemctl enable rclone-mount
# Démarre le service immédiatement
sudo systemctl start rclone-mount
