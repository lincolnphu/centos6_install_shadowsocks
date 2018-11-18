#!/bin/sh
cd /tmp
wget https://github.com/xtaci/kcptun/releases/download/v20181114/kcptun-linux-386-20181114.tar.gz
tar xvf kcptun-linux-386-20181114.tar.gz
chmod +x ./server_linux_386
mv server_linux_386 /usr/bin/
wget -O /usr/local/etc/kcptun-server-config.json https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/kcp.json?token=AJq8XQkA3vzze2k7FAc3gCxAz4fFwffTks5b-tClwA%3D%3D
wget https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/kcp-server?token=AJq8XVJb04KVG4OftbPcnzJNnXgyn1fhks5b-syPwA%3D%3D -O /etc/init.d/kcptun-server
chmod +x /etc/init.d/kcptun-server
chkconfig --add kcptun-server
chkconfig kcptun-server on
/etc/init.d/kcptun-server start
