#!/bin/sh
cd /tmp
wget https://github.com/xtaci/kcptun/releases/download/v20190109/kcptun-linux-386-20190109.tar.gz
tar xvf kcptun-linux-386-20190109.tar.gz
chmod +x ./server_linux_386
mv server_linux_386 /usr/bin/
rm -rf /usr/local/etc/kcptun-server-config.json
wget -O /usr/local/etc/kcptun-server-config.json https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/kcp.json
wget https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/kcp-server -O /etc/init.d/kcptun-server
chmod +x /etc/init.d/kcptun-server
chkconfig --add kcptun-server
chkconfig kcptun-server on
/etc/init.d/kcptun-server start
