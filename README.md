# shadowsocks-script
快速在linode机器上安装配置shadowsocks服务器的脚本


## 基础环境

假定采用的是ubuntu，可能需要安装如下

 * apt install git
 * apt install python-pip

## 依赖的环境

  shadowsocks server 可以用apt和pip安装，更细进度不一样。 

  * pip install shadowsocks
  * pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U

默认的pip是2.9，不支持aes-256-gcm加密，指定新的repo

## 同步配置

同步github上的脚本

 * git clone https://github.com/jumpoutofworld/shadowsocks-script.git
 * 修改脚本中的配置，包括不限于ip，端口，密码


## 测试

测试一下服务是否ok
 * ssserver -c /etc/multi.json -d start

## 开机启动

将ss服务放入启动脚本

编辑 /etc/rc.local， 加入

  * ssserver -c /etc/multi.json -d start
