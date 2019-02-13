# centos6_install_shadowsocks

**在搬瓦工root shell里面输入**：
  1）ss:
```bash 
yum update -y && yum install -y wget && cd /tmp && wget -O start.sh https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/centos6_install_ss.sh && chmod +x ./start.sh && ./start.sh
```

2）kcp：
```bash
cd /tmp && rm -rf * && wget -O kcp.sh https://raw.githubusercontent.com/lincolnphu/centos6_install_shadowsocks/master/kcp.sh && chmod +x kcp.sh && ./kcp.sh
```
