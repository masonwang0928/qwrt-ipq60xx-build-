#!/bin/bash
set -e

echo "===== LiBwrt DIY Script Start ====="

find . -name "*.sh" | xargs dos2unix
find . -name "*.lua" | xargs dos2unix

chmod -R 755 package/*/luci-app-*/root/etc/init.d/
chmod -R 755 package/*/luci-app-*/root/usr/bin/

./scripts/feeds install libcap libcgroup ipset ip-full iptables-nft curl wget ca-certificates

sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

echo "===== DIY Complete ====="
