#!/bin/sh

systemctl --user stop gvfs-gphoto2-volume-monitor.service
systemctl --user stop gvfs-udisks2-volume-monitor.service
systemctl --user stop gvfs-mfc-volume-monitor.service
systemctl --user stop gvfs-mtp-volume-monitor.service
systemctl --user stop gvfs-goa-volume-monitor.service
systemctl --user stop gvfs-afc-volume-monitor.service
gphoto2 --stdout --set-config viewfinder=1 --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0

