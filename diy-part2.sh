#!/bin/bash
#
# Copyright (c) 2019-2023 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Custom for REDMI AX6000
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
sed -i 's/ntp.aliyun.com/0.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/time1.cloud.tencent.com/1.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/time.ustc.edu.cn/2.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/cn.pool.ntp.org/3.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/zh_cn/auto/g' feeds/luci/modules/luci-base/root/etc/uci-defaults/luci-base
sed -i 's/2023-05-13/2023-07-26/g' package/kernel/mt76/Makefile
sed -i 's/PKG_SOURCE_VERSION:=969b7b5ebd129068ca56e4b0d831593a2f92382f/PKG_SOURCE_VERSION:=cd3dfe39276905307cc028ac8edf2c06963cda23/g' package/kernel/mt76/Makefilesed -i 's/PKG_MIRROR_HASH:=d28869591d1cb9a967b72f5cd8215c7b2c3388b7b31147b7b18c797018ab8ffb/PKG_MIRROR_HASH:=413d2d0faa81d834ba13cb9e503e1e3a61e3e071014da6b525a123e5da053f90/g' package/kernel/mt76/Makefile
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/ddns.config feeds/packages/net/ddns-scripts/files/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/vlmcsd.ini feeds/packages/net/vlmcsd/files/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/etc/banner package/base-files/files/etc/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/etc/mtd-rw package/base-files/files/etc/init.d/
chmod 0755 package/base-files/files/etc/init.d/mtd-rw
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/default-settings/zzz-default-settings package/lean/default-settings/files/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/default-settings/Makefile package/lean/default-settings/
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/lean/default-settings/files/zzz-default-settings
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/autocore/index.htm package/lean/autocore/files/arm/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/zones.lua feeds/luci/applications/luci-app-firewall/luasrc/model/cbi/firewall/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/mt7986a-xiaomi-redmi-router-ax6000.dts target/linux/mediatek/dts/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/leds-ws2812b.c package/kernel/leds-ws2812b/src/
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
