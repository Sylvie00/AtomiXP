#!/usr/bin/env bash
set -euo pipefail

TEMP_DIR=$(mktemp -d)
git clone --depth 1 https://github.com/rozniak/xfce-winxp-tc.git "$TEMP_DIR"
cd "$TEMP_DIR"
cd packaging
chmod +x buildall.sh chkdeps.sh
./buildall.sh
BUILD_OUTPUT_DIR="./xptc"
if [ -d "$BUILD_OUTPUT_DIR" ]; then
    find "$BUILD_OUTPUT_DIR" -name "*.rpm" -exec rpm2cpio {} | cpio -idmv -D / \;
fi
cd /
rm -rf "$TEMP_DIR"