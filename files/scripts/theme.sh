#!/usr/bin/env bash

set -ouex pipefail

THEME_NAME="Windows-XP"
REPO_URL="https://github.com/B00merang-Artwork/Windows-XP"
TARGET_DIR="/usr/share/icons"

TEMP_DIR=$(mktemp -d)
git clone --depth 1 "$REPO_URL" "$TEMP_DIR/$THEME_NAME"
mkdir -p "$TARGET_DIR"
cp -r "$TEMP_DIR/$THEME_NAME" "$TARGET_DIR/"
rm -rf "$TEMP_DIR"