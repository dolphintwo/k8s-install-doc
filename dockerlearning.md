# 由浅入深学习docker
*2017年8月8日          Create By Dustin*
<!-- TOC -->

- [由浅入深学习docker](#由浅入深学习docker)
    - [1 简介](#1-简介)
        - [为什么要使用docker（优势）](#为什么要使用docker（优势）)
            - [更快的交付和部署](#更快的交付和部署)
            - [更高效的虚拟化](#更高效的虚拟化)
            - [更轻松的迁移和扩展](#更轻松的迁移和扩展)
            - [简单的管理](#简单的管理)
            - [和传统虚拟机对比总结](#和传统虚拟机对比总结)
        - [docker镜像](#docker镜像)
        - [docker容器](#docker容器)
        - [docker仓库](#docker仓库)
    - [3 安装](#3-安装)
        - [Linux系列的安装](#linux系列的安装)
            - [Ubuntu安装Docker](#ubuntu安装docker)
            - [CentOS安装Docker](#centos安装docker)
        - [Windows系列的安装](#windows系列的安装)
            - [Win7/8安装](#win78安装)
            - [Win10安装](#win10安装)
        - [MacOS的安装](#macos的安装)
    - [4 Docker镜像](#4-docker镜像)
        - [从仓库获取镜像](#从仓库获取镜像)
        - [列出本地镜像](#列出本地镜像)
        - [创建镜像](#创建镜像)
            - [修改已有镜像](#修改已有镜像)
            - [利用Dockerfile来创建镜像](#利用dockerfile来创建镜像)
            - [从本地文件系统导入](#从本地文件系统导入)
            - [上传镜像](#上传镜像)
        - [存出和载入镜像](#存出和载入镜像)
            - [存出镜像](#存出镜像)
            - [载入镜像](#载入镜像)
        - [移除本地镜像](#移除本地镜像)
        - [镜像的实现原理](#镜像的实现原理)
    - [5 Docker容器](#5-docker容器)
        - [启动容器](#启动容器)
            - [新建并启动](#新建并启动)
            - [启动已终止的容器](#启动已终止的容器)
        - [守护态运行](#守护态运行)
        - [终止容器额](#终止容器额)
        - [进入容器](#进入容器)
            - [attach](#attach)
            - [nsenter](#nsenter)
        - [导出和导入容器](#导出和导入容器)
            - [导出容器](#导出容器)
            - [导入容器快照](#导入容器快照)
        - [删除容器](#删除容器)
    - [6 Docker仓库](#6-docker仓库)
        - [Docker Hub](#docker-hub)
            - [登录](#登录)
            - [基本操作](#基本操作)
            - [自动创建](#自动创建)
        - [私有仓库](#私有仓库)
            - [安装运行docker-registry](#安装运行docker-registry)
            - [在私有仓库上传下载搜索镜像](#在私有仓库上传下载搜索镜像)
        - [仓库配置文件](#仓库配置文件)
            - [模板](#模板)
            - [示例配置](#示例配置)
            - [选项](#选项)
    - [7 Docker数据管理](#7-docker数据管理)
        - [数据卷](#数据卷)
            - [创建一个数据卷](#创建一个数据卷)
            - [挂载一个主机目录作为数据卷](#挂载一个主机目录作为数据卷)
            - [挂载一个本地主机文件作为数据卷](#挂载一个本地主机文件作为数据卷)
        - [数据卷容器](#数据卷容器)
        - [利用数据卷容器来备份恢复迁移数据卷](#利用数据卷容器来备份恢复迁移数据卷)
            - [备份](#备份)
            - [恢复](#恢复)
    - [8 Docker网络](#8-docker网络)
        - [外部访问容器](#外部访问容器)
            - [映射所有接口地址](#映射所有接口地址)
            - [映射到指定地址的指定端口](#映射到指定地址的指定端口)
            - [映射到指定地址的任意端口](#映射到指定地址的任意端口)
            - [查看映射端口配置](#查看映射端口配置)
        - [容器互联](#容器互联)
            - [自定义容器命名](#自定义容器命名)
            - [容器互联](#容器互联)
    - [9 高级网络配置](#9-高级网络配置)
        - [快速配置指南](#快速配置指南)
        - [配置DNS](#配置dns)
        - [容器访问控制](#容器访问控制)
            - [容器访问外部网络](#容器访问外部网络)
            - [容器之间访问](#容器之间访问)
        - [映射容器端口到宿主主机的实现](#映射容器端口到宿主主机的实现)
            - [容器访问外部实现](#容器访问外部实现)
            - [外部访问容器实现](#外部访问容器实现)
        - [配置docker0网桥](#配置docker0网桥)
        - [自定义网桥](#自定义网桥)
        - [工具和示例](#工具和示例)
            - [pipework](#pipework)
            - [playground](#playground)
        - [编辑网络配置文件](#编辑网络配置文件)
        - [示例：创建一个点到点连接](#示例：创建一个点到点连接)
    - [10 实战案例](#10-实战案例)
        - [使用 Supervisor 来管理进程](#使用-supervisor-来管理进程)
            - [配置](#配置)
            - [安装ssh、apache和supervisor](#安装ssh、apache和supervisor)
            - [supervisor配置文件内容](#supervisor配置文件内容)
            - [使用方法](#使用方法)
        - [创建tomcat/weblogic集群](#创建tomcatweblogic集群)
            - [安装tomcat镜像](#安装tomcat镜像)
            - [安装weblogic镜像](#安装weblogic镜像)
            - [tomcat/weblogic镜像的使用](#tomcatweblogic镜像的使用)
        - [多台物理主机之间的容器互联（暴露容器到真实网络中）](#多台物理主机之间的容器互联（暴露容器到真实网络中）)
            - [拓扑图](#拓扑图)
            - [ubuntu示例](#ubuntu示例)
        - [标准化开发测试和生产环境](#标准化开发测试和生产环境)

<!-- /TOC -->
## 1 简介
Docker 项目的目标是实现轻量级的操作系统虚拟化解决方案。容器是在操作系统层面上实现虚拟化，直接复用本地主机的操作系统，而传统方式则是在硬件层面实现。
### 为什么要使用docker（优势）
#### 更快的交付和部署
一次创建配置，任何地方都可运行。容器启动的时间都是秒级的，大量节约了开发测试部署的时间。
#### 更高效的虚拟化
Docker 容器的运行不需要额外的 hypervisor 支持，它是内核级的虚拟化，因此可以实现更高的性能和效率。
#### 更轻松的迁移和扩展
docker几乎可以在任何地方运行，这种兼容性可以让用户吧程序从一个平台直接迁移到另一个平台
#### 简单的管理
所有修改都以增量方式被分发和更新，从而实现自动化并且高效管理。
#### 和传统虚拟机对比总结
|特性|容器|虚拟机|
|----|----|----|
|启动|秒级|分钟级|
|磁盘使用|一般为MB|一般为GB|
|性能|接近原生|弱|
|系统支持|单机支持上千|一般几十个|

Docker 包括三个基本概念
* 镜像（Image）
* 容器（Container）
* 仓库（Repository）
### docker镜像
docker镜像就是一个只读模板，镜像可以用来创建docker容器。docker提供一个简单的机制来创建镜像或者更新镜像，用户也可以从其他人那里下载一个已经做好的镜像直接使用。
### docker容器
docker利用容器来运行应用，容器是从镜像创建的运行实例，每个容器都是互相隔离的、保证安全的平台。可以把容器看成一个简易版的linux环境和运行在其中的应用程序。
* 注：镜像是只读的，容器是在启动的时候创建一层科写层作为最上层。
### docker仓库
仓库就是集中存放镜像文件的场所。有时候会把仓库和仓库注册服务器（registry）混为一谈并不严格区分。仓库注册服务器可包含多个仓库，每个仓库又包含多个镜像，每个镜像有不同的标签（tag）。
仓库分为公开仓库和私有仓库。
* docker仓库和git仓库有些类似
## 3 安装
### Linux系列的安装
以ubuntu和centos举例
#### Ubuntu安装Docker
====待完成====
#### CentOS安装Docker
Centos6需要首先安装EPEL库
```
yum install -y epel
yum install -y docker-io
service docker start
chkconfig docker on
```
### Windows系列的安装
Windows10加入了对Docker的支持
#### Win7/8安装
下载[Docker Toolbox](https://www.docker.com/products/docker-toolbox)

安装完是Kitematic和Docker Quickstart Terminal两部分
#### Win10安装
下载[Docker CE（Community Edition）](https://store.docker.com/editions/community/docker-ce-desktop-windows)
### MacOS的安装
====待完成====
## 4 Docker镜像
Docker运行容器前需要本地存在对应的镜像，如果本地不存在该镜像，Docker慧聪镜像仓库下载（默认是Docker Hub公共注测服务器中的仓库）
### 从仓库获取镜像
```
docker pull <image_name:tag>
docker pull <{registry_addr/}image_name:tag>
```
### 列出本地镜像
使用<code>docker images</code>显示本地已有的镜像。
```
$ docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED          SIZE
learn/ping                    latest              2e2c20c94479        6 hours ago         139MB
tomcat                        latest              7856f1f03e2d        2 weeks ago         292MB
selenium/node-firefox         latest              39b948f7c88f        5 weeks ago         631MB
selenium/node-chrome          latest              dd16d697dff6        5 weeks ago         835MB
selenium/hub                  latest              d3dc44f1ed52        5 weeks ago         292MB
hello-world                   latest              1815c82652c0        7 weeks ago         1.84kB
kitematic/hello-world-nginx   latest              03b4557ad7b9        2 years ago         7.91MB
learn/tutorial                latest              a7876479f1aa        4 years ago         128MB
```
会列出如下字段信息
* 来自于哪个仓库
* 镜像的标记 TAG信息用来标记来自同一个仓库的不同镜像，如果不指定具体的标记，则默认使用 latest 标记信息。
* 镜像ID 镜像的 ID 唯一标识了镜像
* 创建时间
* 镜像大小

### 创建镜像
可以从 Docker Hub 获取已有镜像并更新，也可以利用本地文件系统创建一个。
#### 修改已有镜像
先使用下载的镜像启动容器
```
docker run -t -i <REPOSITORY> <command> 
```
作出修改后发现ID变化
```
docker commit -m "msg" -a "author" <ID> <new REPOSITORY name>
```
使用docker images查看新创建的镜像。
```
docker images
```
#### 利用Dockerfile来创建镜像
使用<code>docker commit</code>来扩展一个镜像比较简单，但是不方便在团队中分享，可以使用<code>docker build</code>来创建一个新的镜像。为此，首先需要创建一个Dockerfile。
新建一个目录和一个Dockerfile
```
$ mkdir test
$ cd test
$ touch Dockerfile
$ vi Dockerfile

# This is a comment
# FROM指令告诉Docker使用那个镜像作为基础
FROM ubuntu:14.04
# 维护者信息
MAINTAINER Docker dolphintwo dtdinghui@126.com
RUN apt-get -y install ping
```

编写完成Dockerfile后使用<code>docker build</code>来生成镜像。
```
$ docker build -t="learn/ping:latest" .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM learn/tutorial:latest
 ---> a7876479f1aa
Step 2/3 : MAINTAINER Docker dolphintwo dtdinghui@126.com
 ---> Running in e83161ca0a37
 ---> 37b0ff542776
Removing intermediate container e83161ca0a37
Step 3/3 : RUN apt-get -y install ping
 ---> Running in b56636abab94
Reading package lists...
Building dependency tree...
The following NEW packages will be installed:
  iputils-ping
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 56.1 kB of archives.
After this operation, 143 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu/ precise/main iputils-ping amd64 3:20101006-1ubuntu1 [56.1 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 56.1 kB in 4s (12.0 kB/s)
Selecting previously unselected package iputils-ping.
(Reading database ... 7545 files and directories currently installed.)
Unpacking iputils-ping (from .../iputils-ping_3%3a20101006-1ubuntu1_amd64.deb) .
..
Setting up iputils-ping (3:20101006-1ubuntu1) ...
 ---> cbd1e053c743
Removing intermediate container b56636abab94
Successfully built cbd1e053c743
Successfully tagged learn/ping:latest
SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.
```

#### 从本地文件系统导入
要从本地文件系统导入一个镜像，可以使用openvz的模板来创建：openvz的模板现在地址为[templates（特别卡）](https://openvz.org/Download/template/precreated)
比如先下载一个ubuntu-14.04的镜像，之后使用以下命令导入：
```
sudo cat ubuntu-14.04-x86_64-minimal.tar.gz |docker import - ubuntu:14.04
```
然后通过<code>docker images</code>查看导入的镜像。
#### 上传镜像
用户可以通过<code>docker push</code>命令吧自己创建的镜像上传到仓库中来共享。

### 存出和载入镜像
#### 存出镜像
如果要导出镜像到本地文件，可以使用<code>docker save</code>命令。
```
$ docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED          SIZE
centos                        latest              328edcd84f1b        6 days ago          193MB
tomcat                        latest              7856f1f03e2d        2 weeks ago         292MB
#导出镜像到当前路径
$ docker save -o centos_latest.tar centos:latest
```
#### 载入镜像
可以使用<code>docker load</code>从本地文件导入到本地镜像库
```
$ docker rmi centos
Untagged: centos:latest
Untagged: centos@sha256:26f74cefad82967f97f3eeeef88c1b6262f9b42bc96f2ad61d6f3fdf544759b8
Deleted: sha256:328edcd84f1bbf868bc88e4ae37afe421ef19be71890f59b4b2d8ba48414b84d
Deleted: sha256:b362758f4793674edb79ec5c7192074b2eacf200c006e127069856484526ccf2

$ docker load --input centos_latest.tar
#$ docker load < centos_latest.tar
b362758f4793: Loading layer  200.1MB/200.1MB
Loaded image: centos:latest

$ docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED          SIZE
centos                        latest              328edcd84f1b        6 days ago          193MB
```
### 移除本地镜像
如果要移除本地的镜像，可以使用<code>docker rmi</code>命令。注意<code>docker rm</code>命令是移除容器。
```
$ docker rmi centos
Untagged: centos:latest
Untagged: centos@sha256:26f74cefad82967f97f3eeeef88c1b6262f9b42bc96f2ad61d6f3fdf544759b8
Deleted: sha256:328edcd84f1bbf868bc88e4ae37afe421ef19be71890f59b4b2d8ba48414b84d
Deleted: sha256:b362758f4793674edb79ec5c7192074b2eacf200c006e127069856484526ccf2
```
*注意：在删除镜像之前要先用docker rm删除依赖与整个镜像的所有容器*
### 镜像的实现原理
每个镜像都由很多层次构成，Docker使用Union FS将这些不同的层结合到一个镜像中去。
通常Union FS有两个用途：
* 可以实现不借助LVM、RAID将多个disk挂到同一个目录
* 可以将一个只读分支和一个可写分支联合在一起
Live CD 正是基于此方法可以运行在镜像不变的基础上允许用户在其上进行一些写操作。Docker 在 AUFS 上构建的容器也是利用了类似的原理。
## 5 Docker容器
容器是独立运行的一个或一组应用，以及它们的运行态环境。对应的，虚拟机可以理解为模拟运行的一整套操作系统和跑在上面的应用。
### 启动容器
启动容器有两种方式，一种是基于镜像新建一个容器并启动，另外一个是将在终止状态（stopped）的容器重新启动。因为容器比较轻量，所以，大部分时候用户都是随时删除和新创建容器的。
#### 新建并启动
<code>docker run</code>
启动一个容器输出一个'hello world'，之后终止容器。
```
$ docker run ubuntu:14.04 /bin/echo 'hello world'
hello world
```
启动一个容器bash终端，运行用户交互
```
$ docker run -t -i ubuntu:14.04 /bin/bash
root@localhost:/#
```
其中 -t 让docker分配一个伪终端(pseudo-tty)并绑定到容器的标准输入上
-i 则让容器的标准输入保持打开。

当使用<code>docker run</code>来创建容器时，docker在后台的标准操作包括：
- 检查本地是否存在指定的镜像，不存在就从共有仓库下载 
- 利用镜像创建并启动一个容器
- 分配一个文件系统，并在只读的镜像层外面挂载一层可读写层
- 从宿主主机配置的网桥借口中桥接一个虚拟接口道容器中去
- 从地址池配置一个ip地址给容器
- 执行用户指定的应用程序
- 执行完毕后容器被终止

#### 启动已终止的容器
<code>docker start</code>

### 守护态运行
### 终止容器额
### 进入容器
#### attach
#### nsenter
### 导出和导入容器
#### 导出容器
#### 导入容器快照
### 删除容器

## 6 Docker仓库
### Docker Hub
#### 登录
#### 基本操作
#### 自动创建
### 私有仓库
#### 安装运行docker-registry
#### 在私有仓库上传下载搜索镜像
### 仓库配置文件
#### 模板
#### 示例配置
#### 选项

## 7 Docker数据管理
### 数据卷
#### 创建一个数据卷
#### 挂载一个主机目录作为数据卷
#### 挂载一个本地主机文件作为数据卷

### 数据卷容器

### 利用数据卷容器来备份恢复迁移数据卷
#### 备份
#### 恢复


## 8 Docker网络
### 外部访问容器
#### 映射所有接口地址
#### 映射到指定地址的指定端口
#### 映射到指定地址的任意端口
#### 查看映射端口配置
### 容器互联
#### 自定义容器命名
#### 容器互联

## 9 高级网络配置
### 快速配置指南
### 配置DNS
### 容器访问控制
#### 容器访问外部网络
#### 容器之间访问
### 映射容器端口到宿主主机的实现
#### 容器访问外部实现
#### 外部访问容器实现
### 配置docker0网桥
### 自定义网桥
### 工具和示例
#### pipework
#### playground
### 编辑网络配置文件
### 示例：创建一个点到点连接



## 10 实战案例
### 使用 Supervisor 来管理进程
#### 配置
#### 安装ssh、apache和supervisor
#### supervisor配置文件内容
#### 使用方法
### 创建tomcat/weblogic集群
#### 安装tomcat镜像
#### 安装weblogic镜像
#### tomcat/weblogic镜像的使用
### 多台物理主机之间的容器互联（暴露容器到真实网络中）
#### 拓扑图
#### ubuntu示例
### 标准化开发测试和生产环境
