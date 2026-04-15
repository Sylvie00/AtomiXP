#!/bin/bash
set -oue pipefail

# fix plugin crashes
sudo -u "${USER:-user}" xfconf-query -c xfce4-panel -p /force-all-internal -t bool -s true --create

# set taskbar to bottom
sudo -u "${USER:-user}" xfconf-query -c xfce4-panel -p /panels/panel-1/position -t string -s "p=8;x=0;y=0"

# autostart xfce
mkdir -p /etc/skel/.config/labwc
cat <<EOF > /etc/skel/.config/labwc/autostart
xfsettingsd &
xfce4-panel &
xfdesktop &
nm-applet &
EOF
chmod +x /etc/skel/.config/labwc/autostart