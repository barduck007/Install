
sudo ln -s /etc/systemd/system/rclone-mount.service rclone-mount.service
# Active le service pour qu'il démarre au boot
sudo systemctl enable rclone-mount@1000
# Démarre le service immédiatement
sudo systemctl start rclone-mount@1000
