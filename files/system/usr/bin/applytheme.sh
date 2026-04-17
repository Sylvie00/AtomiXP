#!/usr/bin/env bash
set -euo pipefail

apply_theme() {
    local user=$1
    local home=$(getent passwd "$user" | cut -d: -f6)
    
    # skip if already configured
    [ -f "$home/.config/atomixp-configured" ] && return
    
    mkdir -p "$home/.config/xfce4/xfconf/xfce-perchannel-xml"
    
    # copy theme configs from skel
    cp /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml \
        "$home/.config/xfce4/xfconf/xfce-perchannel-xml/"
    cp /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml \
        "$home/.config/xfce4/xfconf/xfce-perchannel-xml/"
    cp /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml \
        "$home/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"
    cp /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml \
        "$home/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
    cp "/etc/skel/.config/autostart/WinTC Desktop.desktop" \
        "$home/.config/autostart/WinTC Desktop.desktop"
    cp "/etc/skel/.config/autostart/WinTC Taskband.desktop" \
        "$home/.config/autostart/WinTC Taskband.desktop"
    
    # fix ownership
    chown -R "$user:$user" "$home/.config/xfce4"
    
    # mark as configured
    touch "$home/.config/atomixp-configured"
    chown "$user:$user" "$home/.config/atomixp-configured"
}

# get all human users (uid 1000+)
while IFS=: read -r user _ uid _; do
    [ "$uid" -ge 1000 ] && apply_theme "$user"
done < /etc/passwd