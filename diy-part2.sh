#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.1/g' package/base-files/files/bin/config_generate   # 修改默认ip
sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd    # 替换终端为bash

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile   # 选择argon为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile   # 选择argon为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile   # 选择argon为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile   # 选择argon为默认主题
# sed -i 's/+uhttpd +uhttpd-mod-ubus //g' feeds/luci/collections/luci/Makefile    # 删除uhttpd
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings    # 设置密码为空
# sed -i 's/PATCHVER:=5.10/PATCHVER:=5.15/g' target/linux/x86/Makefile   # x86机型,默认内核5.10，修改内核为5.15
# rm -rf feeds/packages/utils/runc/Makefile   # 临时删除run1.0.3
# svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile feeds/packages/utils/runc/Makefile   # 添加runc1.0.2
git clone --depth 1 https://github.com/vernesong/OpenClash package/luci-app-openclash
rm -rf feeds/luci/themes/luci-theme-argon    # 删除自带argon
git clone -b master https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon    # 替换新版argon
git clone https://github.com/danchexiaoyang/luci-app-syncthing.git feeds/luci/luci-app-syncthing # 添加文件自动同步插件
git clone https://github.com/AE86JAY/luci-app-easymesh.git feeds/luci/luci-app-easymesh #添加简易mesh组网插件