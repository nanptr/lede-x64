#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add adguardhome 
git clone https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome

# Add luci-app-ssr-plus
git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus

# Add luci-app-smartdns
svn export https://github.com/281677160/openwrt-package/trunk/luci-app-smartdns

# Add luci-app-openclash
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git remote add -f origin https://github.com/vernesong/OpenClash.git
git pull --depth 1 origin master
git branch --set-upstream-to=origin/master master
cd ../..
