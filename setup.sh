# 安装shadowsocks server，可能要安装python，更新pip
# pip install shadowsocks
# 默认的pip是2.9，不支持aes-256-gcm加密，指定新的repo
pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U

# 同步github上的脚本
git clone https://github.com/jumpoutofworld/shadowsocks-script.git

# 修改脚本中的配置，包括不限于ip，端口，密码


# 测试一下服务是否ok
ssserver -c /etc/multi.json -d start

#将ss服务放入启动脚本
# 编辑 /etc/rc.local， 加入
ssserver -c /etc/multi.json -d start


