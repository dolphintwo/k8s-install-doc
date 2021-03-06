# 由浅入深学习docker（一）
*2017年8月8日          Create By Dustin*
<!-- TOC -->

- [由浅入深学习docker（一）](#由浅入深学习docker（一）)
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
| 特性     | 容器         | 虚拟机     |
| -------- | ------------ | ---------- |
| 启动     | 秒级         | 分钟级     |
| 磁盘使用 | 一般为MB     | 一般为GB   |
| 性能     | 接近原生     | 弱         |
| 系统支持 | 单机支持上千 | 一般几十个 |

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
使用`docker images`显示本地已有的镜像。
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
使用`docker commit`来扩展一个镜像比较简单，但是不方便在团队中分享，可以使用`docker build`来创建一个新的镜像。为此，首先需要创建一个Dockerfile。
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

编写完成Dockerfile后使用`docker build`来生成镜像。
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
然后通过`docker images`查看导入的镜像。
#### 上传镜像
用户可以通过`docker push`命令吧自己创建的镜像上传到仓库中来共享。

### 存出和载入镜像
#### 存出镜像
如果要导出镜像到本地文件，可以使用`docker save`命令。
```
$ docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED          SIZE
centos                        latest              328edcd84f1b        6 days ago          193MB
tomcat                        latest              7856f1f03e2d        2 weeks ago         292MB
#导出镜像到当前路径
$ docker save -o centos_latest.tar centos:latest
```
#### 载入镜像
可以使用`docker load`从本地文件导入到本地镜像库
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
如果要移除本地的镜像，可以使用`docker rmi`命令。注意`docker rm`命令是移除容器。
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
`docker run`
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

当使用`docker run`来创建容器时，docker在后台的标准操作包括：
- 检查本地是否存在指定的镜像，不存在就从共有仓库下载 
- 利用镜像创建并启动一个容器
- 分配一个文件系统，并在只读的镜像层外面挂载一层可读写层
- 从宿主主机配置的网桥借口中桥接一个虚拟接口道容器中去
- 从地址池配置一个ip地址给容器
- 执行用户指定的应用程序
- 执行完毕后容器被终止

#### 启动已终止的容器
`docker start`
容器核心所执行的应用程序，所需要的资源都是应用程序运行所必需的。除此之外，并没有其他的资源。可以在伪终端中使用`ps`或者`top`查看进场信息。
```
$ docker run -t -i ubuntu:latest /bin/bash

root@503cda4ec740:/# ps
  PID TTY          TIME CMD
    1 pts/0    00:00:00 bash
  200 pts/0    00:00:00 ps
```
容器中仅运行了指定的bash应用。这种特点使得Docker对资源的利用率极高。
### 守护态运行
更多的时候需要让Docker容器在后台以守护态（Deamonized）形式运行。，可以通过添加`-d`参数来实现。
```
$ docker run -d ubuntu:latest /bin/sh -c "while true; do echo hello world; sleep 1; done"
efd9674156095d0ebebb82fd565c0f4c53e7ccc04dd36211b1b0cc153a606634

$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED     STATUS              PORTS               NAMES
efd967415609        ubuntu:latest       "/bin/sh -c 'while..."   4 seconds ago     Up 5 seconds                            friendly_brattain
//获取容器的输出信息，通过docker logs命令查看
$ docker logs friendly_brattain
hello world
hello world
hello world
hello world
hello world
```
### 终止容器额
可以使用 docker stop 来终止一个运行中的容器。

此外，当Docker容器中指定的应用终结时，容器也自动终止。 例如对于上一章节中只启动了一个终端的容器，用户通过 exit 命令或 Ctrl+d 来退出终端时，所创建的容器立刻终止。

终止状态的容器可以用`docker ps -a`命令看到
```
$ docker stop efd
efd

$ docker ps -a
CONTAINER ID    IMAGE           COMMAND                  CREATED           STATUS                        PORTS      NAMES
efd967415609    ubuntu:latest   "/bin/sh -c 'while..."   6 minutes ago     Exited (137) 9 seconds ago           friendly_brattain
```
### 进入容器
在使用-d参数时，容器启动后会进入后台。某些时候需要进入容器进行操作，很多种方法，包括使用`docker attach`命令或`nsenter`工具等。
#### attach
`docker attach`是docker自带的命令
```
$ docker ps -a
CONTAINER ID    IMAGE   COMMAND         CREATED             STATUS          PORTS       NAMES
6dd2d2aadc1a    ubuntu  "/bin/bash"     3 seconds ago       Up 3 seconds            peaceful_ramanujan

$ docker attach peaceful_ramanujan
root@6dd2d2aadc1a:/#
```
#### nsenter
**暂时略过**
### 导出和导入容器

#### 导出容器
```
$ docker ps -a
CONTAINER ID    IMAGE   COMMAND      CREATED            STATUS                      PORTS   NAMES
6dd2d2aadc1a    ubuntu  "/bin/bash" 19 minutes ago      Exited (0) 6 seconds ago            peaceful_ramanujan

$ docker export 6dd > ubuntu.tar
```
#### 导入容器快照
`docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]`

用户既可以使用 docker load 来导入镜像存储文件到本地镜像库，也可以使用 docker import 来导入一个容器快照到本地镜像库。这两者的区别在于容器快照文件将丢弃所有的历史记录和元数据信息（即仅保存容器当时的快照状态），而镜像存储文件将保存完整记录，体积也要大。此外，从容器快照文件导入时可以重新指定标签等元数据信息。
### 删除容器
`docker rm [OPTIONS] CONTAINER [CONTAINER...]`

删除运行中的容器可以添加`-f`参数

**注意区分rmi和rm**
