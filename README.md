Table of Contents
=================

   * [TODO查看日志](#TODO放到启动服务中的日志在哪里查看)
   * [shadowsocks-script](#shadowsocks-script)
      * [基础环境](#基础环境)
      * [依赖的环境](#依赖的环境)
      * [同步配置](#同步配置)
      * [测试](#测试)
      * [开机启动](#开机启动)
      
# TODO放到启动服务中的日志在哪里查看

目前新加坡的机器OK，但是不知道日志哪里看

# shadowsocks-script

快速在linode机器上安装配置shadowsocks服务器的相关配置。


## 基础环境

假定采用的是ubuntu，可能需要安装git和pip包。

 * apt install git
 * apt install python-pip

## 依赖的环境

  shadowsocks server 可以用apt和pip安装，两个软件源的版本不一样。 

  默认的pip是2.9，不支持aes-256-gcm加密，指定新的repo
  * pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
  
  如果采用默认的aes-256-cfb加密，可以简化
  * pip install shadowsocks
  
  实际上，iOS系统上的ss client是瓶颈，中国区的appstore没有合法的客户端。包括 影梭、wingy、shadowrocket。所以只能用老版本client。
  这些client不支持 aes-256-gcm和chacha20-ietf-poly1305。所以，最终推荐还是用aes-256-cfb。
  


## 同步配置

下载github上的配置

 * git clone https://github.com/jumpoutofworld/shadowsocks-script.git

修改配置，包括且不限于服务器ip，端口，密码等。


## 测试

测试一下服务是否ok
 * ssserver -c config/multi.json -d start

## 开机启动

将ss服务放入启动脚本。 ubuntu 18.04采用了systemd的启动机制，过程比较复杂. 参考。
https://blog.csdn.net/zhengchaooo/article/details/80202599

  将rc.local的执行放入systemd体系
  * ln -fs /lib/systemd/system/rc-local.service /etc/systemd/system/rc-local.service
  
  创建rc.local文件
  * touch /etc/rc.local
  * chmod 755 /etc/rc.local
  
  编辑rc.local文件
  * #!/bin/bash
  * ssserver -c /root/shadowsocks-script/config/multi.json -d start

