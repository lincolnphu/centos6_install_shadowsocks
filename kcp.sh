#!/bin/sh
cd /tmp
wget https://github.com/xtaci/kcptun/releases/download/v20181114/kcptun-linux-386-20181114.tar.gz
tar xvf kcptun-linux-386-20181114.tar.gz
chmod +x ./server_linux_386
mv server_linux_386 /usr/bin/
wget -O /usr/local/etc/kcptun-server-config.json https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/kcp.json?token=AJq8XXqNwBQOi9XGOQXSyOuKSFXVmih9ks5b-r8AwA%3D%3D
wget https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/kcp-server?token=AJq8XTeDqNPRGlvAMPkRbuT3xwnNMoVlks5b-sFFwA%3D%3D -O /etc/init.d/kcptun-server
chmod +x /etc/init.d/kcptun-server
chkconfig --add kcptun-server
chkconfig kcptun-server on
/etc/init.d/kcptun-server start
