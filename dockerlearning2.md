# 由浅入深学习docker（二）
*2017年8月17日          Create By Dustin*
<!-- TOC -->

- [由浅入深学习docker（二）](#由浅入深学习docker（二）)
    - [6 Docker仓库](#6-docker仓库)
        - [Docker Hub](#docker-hub)
            - [登录](#登录)
            - [基本操作](#基本操作)
            - [自动创建](#自动创建)
        - [私有仓库](#私有仓库)
            - [安装运行docker-registry](#安装运行docker-registry)
                - [容器运行](#容器运行)
                - [本地安装](#本地安装)
            - [在私有仓库上传/下载/搜索镜像](#在私有仓库上传下载搜索镜像)
        - [仓库配置文件](#仓库配置文件)
            - [模板](#模板)
            - [示例配置 选项](#示例配置-选项)
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
## 6 Docker仓库
仓库(Repository)是集中存放镜像的地方。
一个很容易混淆的概念就是注册服务器(Registry).实际上注册服务器是管理仓库的具体服务器，每个服务器上可以有多个仓库，而每个仓库下面有多个镜像。
### Docker Hub
Docker官方目前维护了一个公共的仓库[Docker Hub](https://hub.docker.com/)，国内一般使用[阿里云开发者平台](https://dev.aliyun.com)做镜像加速,使用加速器将会提升您在国内获取Docker官方镜像的速度！
#### 登录
可以执行`docker login`命令来输入用户名/密码来完成登录
```
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't
have a Docker ID, head over to https://hub.docker.com to create one.
Username: dolphintwo
Password:
Login Succeeded
```
#### 基本操作
用户无需登录即可通过`docker search`命令来查找官方仓库中的镜像，并利用`docker pull`命令来将它下载到本地。
```
$ docker search centos
NAME                           DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
centos                         The official build of CentOS.                   3568      [OK]
jdeathe/centos-ssh             CentOS-6 6.9 x86_64 / CentOS-7 7.3.1611 x8...   81                   [OK]
tutum/centos                   Simple CentOS docker image with SSH access      33
······

$ docker pull centos
Using default tag: latest
latest: Pulling from library/centos
74f0853ba93b: Pull complete
Digest: sha256:26f74cefad82967f97f3eeeef88c1b6262f9b42bc96f2ad61d6f3fdf544759b8
Status: Downloaded newer image for centos:latest
```
用户也可以在登录后通过`docker push`命令将镜像推送到Docker Hub。
#### 自动创建
自动创建(Automated Builds)允许用户通过`Docker Hub`指定跟踪一个目标网站（比如GitHub）上的项目，一旦项目发生新的提交，则自动执行创建。
要配置自动创建，包括如下步骤：
- 创建并登录Docker Hub以及目标网站
- 在目标网站中连接账户到Docker Hub
- 在Docker Hub中配置一个自动创建
- 选取一个目标网站中的项目（需要含dockerfile）和分支
- 指定dockerfile位置并提交创建

之后，可以在Docker Hub的自动创建页面中跟踪每次创建的状态。

### 私有仓库
`docker-registry`是官方提供的工具，可以用于构建私有的镜像仓库。
#### 安装运行docker-registry
##### 容器运行
在安装Docker之后，可以通过获取官方的`registry`镜像来运行。
```
$ docker run -d -p 5000:5000 registry
Unable to find image 'registry:latest' locally
latest: Pulling from library/registry
90f4dba627d6: Pull complete
3a754cdc94a5: Pull complete
bf16d9b6d4c1: Pull complete
7eea83c9b7bb: Pull complete
23293c727551: Pull complete
Digest: sha256:f5552e60ffd56fecbe2f04b61a3089a9cd755bd9352b6b5ab22cf2208af6a3a8
Status: Downloaded newer image for registry:latest
34b2d68ccbcb760265d606dc8061a366c92395226d36c904bd88e29a0b696c2b
```
可以指定配置文件或是配置项，镜像目录等等。
##### 本地安装
对于Ubuntu或CentOS等发行版本，可以直接通过源安装。
- Ubuntu安装
```
apt-get install -y build-essential python-dev libevent-dev python-pip liblzma-dev
pip install docker-registry
```
- CentOS安装
```
yum install -y python-devel libevent-devel python-pip gcc xz-devel
python-pip install docker-registry
``` 
#### 在私有仓库上传/下载/搜索镜像
===========暂时未写============
### 仓库配置文件
Dockerde Registry利用配置文件提供了一些仓库的模板(flavor)，用户可以直接使用它们来进行开发或生产部署。
#### 模板

#### 示例配置 选项

## 7 Docker数据管理
在容器中管理数据主要有两种方式：
- 数据卷(Data volumes)
- 数据卷容器(Data volumes containers)
### 数据卷
数据卷是一个可供一个或多个容器使用的特殊目录，他绕过`UFS`，可以提供很多有用的特性：
- 数据卷可以在容器之间共享和重用
- 对数据卷的修改会立马生效
- 对数据卷的更新，不会影响镜像
- 卷会一直存在，知道没有容器使用

数据卷的使用，类似Linux下对目录或文件进行mount。
#### 创建一个数据卷
在使用`docker run`命令的时候使用-v标记来创建一个数据卷并挂载到容器里。在一次run中多次使用可以挂载多个数据卷。
下面创建一个web容器，并加载一个数据卷到容器的/webapp目录。
```
docker run -d -P --name web -v /webapp training/webapp python app.py
```
注意：也可以在Dockerfile中使用VOLUME来添加一个或者多个新的卷到由该镜像创建的任意容器。
#### 挂载一个主机目录作为数据卷
使用-v标记也可以指定挂载一个本地主机的目录到容器中去。
```
docker run -d -P --name web -v /src/webapp:/opt/webapp training/webapp python app.py
```
上面的命令加载主机的`/src/webapp`目录到容器的`/opt/webapp`目录。这个功能在进行测试的时候十分方便，比如用户可以放置一些程序到本地目录中，来查看容器是否正常工作。本地目录的路径必须是绝对路径，如果目录不存在Docker会自动为你创建它。

注意：Dockerfile中还不支持这种用法，不同的操作系统的路径格式不同。
Docker挂载数据卷的默认权限是读写，用户也可以通过 :ro 指定为只读。
```
docker run -d -P --name web -v /src/webapp:/opt/webapp:ro training/webapp python app.py
```
#### 挂载一个本地主机文件作为数据卷
-v 标记也可以从主机挂载单个文件到容器中

```
docker run --rm -it -v ~/.bash_history:/.bash_history ubuntu /bin/bash
```
这样就可以记录在容器中输入过的命令了。
注意：如果直接挂载一个文件，很多文件编辑工具可能会造成文件inode的改变。这会导致报错误信息，最简单的办法就是直接挂载文件的父级目录。
### 数据卷容器
数据卷容器就是一个正常的容器，专门用来提供数据卷供其他容器挂载的。
首先创建一个命名的数据卷容器dbdata：
```
docker run -d -v /data --name dbdata training/postgres echo Data-only container for postgres
```
然后在其他容器中使用`--volumes-from`来挂载`dbdata`容器中的数据卷。
```
docker run -d --volumes-from dbdata --name db1 training/postgres
docker run -d --volumes-from dbdata --name db2 training/postgres
```
也可以使用多个`--volumes-from`参数来从多个容器挂载多个数据卷。也可以从其他已经挂载了数据卷的容器来挂载数据卷。
```
docker run -d --name db3 --volumes-from db1 training/postgres
```
注意：使用`--volumes-from`参数所挂载数据卷的容器自己并不需要保持在运行状态。
如果删除了挂载的容器（包括dbdata、db1、db2）数据卷并不会被自动删除，如果删除一个数据卷，必须在删除最后一个还挂载着它的容器是使用`docker rm -v`命令来指定同事删除关联的容器。这可以让用户在容器之前升级和移动数据卷。具体的操作将在下一节中进行讲解。
### 利用数据卷容器来备份恢复迁移数据卷
可以利用数据卷对其中的数据进行备份，恢复和迁移。
#### 备份
首先使用`--volumes-from`标记来创建一个加载`dbdata`容器卷的容器，并从本地主机挂载当前到容器的/backup目录。命令如下：
```
docker run --volumes-from dbdata -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar
```
容器启动后，使用`tar`命令来将`dbdata`卷备份为本地的`/backup/backup.tar`。
#### 恢复
如果要恢复数据到一个容器，首先创建一个带有数据卷的容器`dbdata2`。
```
docker run -v /dbdata --name dbdata2 ubuntu /bin/bush
```
然后创建另一个容器，挂载`dbdata`的容量，并使用`untar`解压备份文件到挂载的容器卷中。
```
docker run --volumes-from dbdata2 -v $(pwd):/backup busybox tar xvf /backup/backup.tar
```
## 8 Docker网络
Docker允许通过外部访问容器或容器互联的方式来提供网络服务。
### 外部访问容器
容器中可以允许一些网络应用，要让外部可以访问这些应用，可以通过-P或-p参数来指定端口映射。
当使用-P标记时，Docker会随机映射一个端口到内部容器开放的网络端口。
使用docker ps可以看到本地主机的32768端口被映射到了容器的5000端口。此时访问本机的32768端口即可访问容器内web应用提供的界面。
```
$ docker run -d -P training/webapp python app.py
$ docker ps -l
CONTAINER ID    IMAGE           COMMAND         CREATED         STATUS          PORTS                   NAMES
74839f89788d    training/webapp "python app.py" 22 seconds ago  Up 21 seconds   0.0.0.0:32768->5000/tcp nifty_babbage
```
同样的，可以通过docker logs命令来查看应用的信息。
```
$ docker logs -f nifty_babbage
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
_
```
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
