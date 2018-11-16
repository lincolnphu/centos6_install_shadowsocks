#!/bin/sh

yum -y update
yum --enablerepo=epel -y install libev-devel
yum --enablerepo=epel  -y install pcre-devel
yum install -y wget git  gcc  libtool automake make zlib-devel openssl-devel asciidoc xmlto c-ares-devel

compile_ss (){
cd /tmp
git clone https://github.com/shadowsocks/shadowsocks-libev.git
git submodule update --init --recursive
cd shadowsocks-libev
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz
tar xvf libsodium-1.0.16.tar.gz
pushd libsodium-1.0.16
./configure --prefix=/usr && make
make install
popd
ldconfig

wget https://tls.mbed.org/download/mbedtls-2.6.0-gpl.tgz
tar xvf mbedtls-2.6.0-gpl.tgz
pushd mbedtls-2.6.0
make SHARED=1 CFLAGS=-fPIC
make DESTDIR=/usr install
popd
ldconfig

./autogen.sh && ./configure --prefix=/usr && make
make install
}
compile_autoconfig (){
cd /tmp
wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.68.tar.gz
tar zxvf autoconf-2.68.tar.gz
cd autoconf-2.68
./configure --prefix=/usr
make && make install
}

compile_obfs () {
cd /tmp
git clone https://github.com/shadowsocks/simple-obfs.git
cd simple-obfs
git submodule update --init --recursive
./autogen.sh
./configure --prefix=/usr && ln -s /usr/include/libev/ev.h ./src/ev.h && make
sudo make install
}

compile_after () {
mkdir /etc/shadowsocks-libev
cp /tmp/shadowsocks-libev/rpm/SOURCES/etc/init.d/shadowsocks-libev /etc/init.d/
cp /tmp/simple-obfs/debian/config.json /etc/shadowsocks-libev
chmod +x /etc/init.d/shadowsocks-libev
chkconfig --add shadowsocks-libev
service shadowsocks-libev start
}
compile_autoconfig
compile_ss
compile_obfs
compile_after


