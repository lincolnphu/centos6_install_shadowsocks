#!/bin/sh

yum update
yum install wget git
cd /etc/yum.repos.d/
wget https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-6/librehat-shadowsocks-epel-6.repo
yum install shadowsocks-libev
compile_ss (){
cd /tmp
yum install gettext gcc autoconf libtool automake make asciidoc xmlto c-ares-devel libev-devel
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz
tar xvf libsodium-1.0.16.tar.gz
pushd libsodium-1.0.16
./configure --prefix=/usr && make
make install
popd
ldconfig

wget https://tls.mbed.org/download/start/mbedtls-2.6.0-gpl.tgz
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
yum install gcc autoconf libtool automake make zlib-devel openssl-devel asciidoc xmlto
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
./configure --prefix=/usr && make
sudo make install
}

compile_autoconfig
compile_obfs

