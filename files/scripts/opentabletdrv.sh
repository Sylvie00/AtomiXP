#!/usr/bin/env bash

set -oue pipefail

mkdir -p /tmp/otdrv
cd /tmp/otdrv
curl -LO https://github.com/OpenTabletDriver/OpenTabletDriver/releases/download/v0.6.6.2/opentabletdriver-0.6.6.2-1.x86_64.rpm

rpm-ostree install opentabletdriver*.rpm