#!/usr/bin/env bash
set -xueo pipefail

#install latest xfce-wintc-xp
dnf5 install -y $(cat packages/xfce-winxp-tc/build-deps.txt)

mkdir -p /tmp/xfce-winxp-tc
cd /tmp/xfce-winxp-tc
git clone https://github.com/rozniak/xfce-winxp-tc.git
cd xfce-winxp-tc
bash packaging/buildall.sh

rpm-ostree install xptc/*/rpm/std/x86_64/fre/wintc-*.rpm

plymouth-set-default-theme bootvid

#install RedmondXP as an alternative theme
git clone https://github.com/matthewmx86/RedmondXP.git /tmp/redmondxp
mkdir -p /usr/share/themes
cp -r /tmp/redmondxp/RedmondXP /usr/share/themes/