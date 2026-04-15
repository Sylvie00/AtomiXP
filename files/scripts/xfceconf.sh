#!/usr/bin/env bash
set -euo pipefail

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

git clone --depth 1 https://github.com/rozniak/xfce-winxp-tc.git "$TEMP_DIR"
cd "$TEMP_DIR/packaging"
chmod +x buildall.sh chkdeps.sh

./chkdeps.sh
./buildall.sh

find ./xptc -name "*.rpm" -print0 | xargs -0 dnf install -y --nogpgcheck