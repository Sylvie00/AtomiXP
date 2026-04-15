#!/usr/bin/env bash
set -euo pipefail

# Make sure the labwc autostart is executable
if [ -f /etc/skel/.config/labwc/autostart ]; then
    chmod +x /etc/skel/.config/labwc/autostart
fi