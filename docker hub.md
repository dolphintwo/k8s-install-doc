# 阿里开发者平台
<!-- TOC -->

- [阿里开发者平台](#阿里开发者平台)
    - [Ubuntu配置](#ubuntu配置)
        - [安装／升级你的Docker客户端](#安装／升级你的docker客户端)
        - [如何使用Docker加速器](#如何使用docker加速器)
            - [针对Docker客户端版本大于1.10的用户](#针对docker客户端版本大于110的用户)
    - [CentOS配置](#centos配置)
    - [Windows配置](#windows配置)
        - [安装／升级你的Docker客户端](#安装／升级你的docker客户端)
        - [如何使用Docker加速器](#如何使用docker加速器)
        - [注意](#注意)
        - [相关文档](#相关文档)
    - [Mac配置](#mac配置)
        - [安装／升级你的Docker客户端](#安装／升级你的docker客户端)
        - [如何使用Docker加速器](#如何使用docker加速器)
        - [相关文档](#相关文档)

<!-- /TOC -->
国内一般使用[阿里云开发者平台](https://dev.aliyun.com)做镜像加速,使用加速器将会提升您在国内获取Docker官方镜像的速度！

登录管理控制台
您的专属加速器地址：[https://xxxxxxxxxx.mirror.aliyuncs.com](https://omrhxrz9.mirror.aliyuncs.com)
## Ubuntu配置

### 安装／升级你的Docker客户端

推荐安装<code>1.10.0</code>以上版本的Docker客户端。

您可以通过阿里云的镜像仓库下载：[docker-engine](http://mirrors.aliyun.com/help/docker-engine)、[docker-ce](http://mirrors.aliyun.com/help/docker-ce)

或执行以下命令：
```
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
```
### 如何使用Docker加速器
#### 针对Docker客户端版本大于1.10的用户

您可以通过修改daemon配置文件/etc/docker/daemon.json来使用加速器：
```
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://xxxxxxxxxx.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## CentOS配置

**参照Ubuntu配置**
## Windows配置
### 安装／升级你的Docker客户端
- 对于Windows 10以下的用户 推荐使用<code>Docker Toolbox</code>
    - Toolbox的介绍和帮助：<http://mirrors.aliyun.com/help/docker-toolbox>
    - Windows系统的安装文件目录：<http://mirrors.aliyun.com/docker-toolbox/windows/docker-toolbox/>
- 对于Windows 10以上的用户 推荐使用<code>Docker for Windows</code>
    - Windows系统的安装文件目录：<http://mirrors.aliyun.com/docker-toolbox/windows/docker-for-windows/>
### 如何使用Docker加速器
1. 创建一台安装有Docker环境的Linux虚拟机，指定机器名称为default，同时配置Docker加速器地址。
```
docker-machine create --engine-registry-mirror=https://xxxxxxxxxx.mirror.aliyuncs.com -d virtualbox default
```
2. 查看机器的环境配置，并配置到本地，并通过Docker客户端访问Docker服务。
```
docker-machine env default
eval "$(docker-machine env default)"
docker info
```
### 注意
1. Docker for Windows 和 Docker Toolbox是不兼容，如果同时安装两者的话，需要使用hyperv的参数启动。
```
docker-machine create --engine-registry-mirror=https://xxxxxxxxxx.mirror.aliyuncs.com -d hyperv default
```
2. Docker for Windows 有两种运行模式，一种运行Windows相关容器，一种运行传统的Linux容器。同一时间只能选择一种模式运行。
### 相关文档
[Docker 命令参考文档](https://docs.docker.com/engine/reference/commandline/cli/)

[Dockerfile 镜像构建参考文档](https://docs.docker.com/engine/reference/builder/)
## Mac配置
### 安装／升级你的Docker客户端
- 对于10.10.3以下的用户 推荐使用<code>Docker Toolbox</code>
    - Toolbox的介绍和帮助：<http://mirrors.aliyun.com/help/docker-toolbox>
    - Mac系统的安装文件目录：<http://mirrors.aliyun.com/docker-toolbox/mac/docker-toolbox/>
- 对于10.10.3以上的用户 推荐使用<code>Docker for Mac</code>
    - Mac系统的安装文件目录：<http://mirrors.aliyun.com/docker-toolbox/mac/docker-for-mac/>
### 如何使用Docker加速器
1. 创建一台安装有Docker环境的Linux虚拟机，指定机器名称为default，同时配置Docker加速器地址。
```
docker-machine create --engine-registry-mirror=https://xxxxxxxxxx.mirror.aliyuncs.com -d virtualbox default
```
2. 查看机器的环境配置，并配置到本地，并通过Docker客户端访问Docker服务。
```
docker-machine env default
eval "$(docker-machine env default)"
docker info
```
### 相关文档
[Docker 命令参考文档](https://docs.docker.com/engine/reference/commandline/cli/)

[Dockerfile 镜像构建参考文档](https://docs.docker.com/engine/reference/builder/)