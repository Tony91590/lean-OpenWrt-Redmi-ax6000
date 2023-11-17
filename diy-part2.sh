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
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
sed -i 's/ntp.aliyun.com/0.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/#TARGET_DEVICES/TARGET_DEVICES/g' target/linux/mediatek/image/filogic.mk
sed -i 's/time1.cloud.tencent.com/1.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/time.ustc.edu.cn/2.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/cn.pool.ntp.org/3.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
sed -i 's/zh_cn/auto/g' feeds/luci/modules/luci-base/root/etc/uci-defaults/luci-base 
sed -i '/AUTOLOAD:=$(call AutoProbe,mt7915e)/a \  MODPARAMS.mt7915e:=wed_enable=Y' package/kernel/mt76/Makefile
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/ddns.config feeds/packages/net/ddns-scripts/files/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/etc/banner package/base-files/files/etc/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/default-settings/zzz-default-settings package/lean/default-settings/files/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/default-settings/Makefile package/lean/default-settings/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/autocore/index.htm package/lean/autocore/files/arm/
cp $GITHUB_WORKSPACE/lean/Redmi-AX6000/data/zones.lua feeds/luci/applications/luci-app-firewall/luasrc/model/cbi/firewall/
