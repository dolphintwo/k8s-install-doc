# 由浅入深学习docker
*2017年8月8日          Create By Dustin*
<!-- TOC -->

- [由浅入深学习docker](#由浅入深学习docker)
    - [1 简介](#1-简介)
        - [为什么要使用docker（优势）](#为什么要使用docker优势)
            - [更快的交付和部署](#更快的交付和部署)
            - [更高效的虚拟化](#更高效的虚拟化)
            - [更轻松的迁移和扩展](#更轻松的迁移和扩展)
            - [简单的管理](#简单的管理)
            - [和传统虚拟机对比总结](#和传统虚拟机对比总结)
    - [2 基本概念](#2-基本概念)
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
        - [终止容器](#终止容器)
        - [进入容器](#进入容器)
            - [attach](#attach)
            - [nsenter](#nsenter)
        - [导出和导入容器](#导出和导入容器)
            - [导出容器](#导出容器)
            - [导入容器快照](#导入容器快照)
        - [删除容器](#删除容器)
    - [6 Docker仓库](#6-docker仓库)
    - [7 Docker数据管理](#7-docker数据管理)
    - [8 Docker网络](#8-docker网络)
    - [9 高级网络配置](#9-高级网络配置)
    - [10 实战案例](#10-实战案例)

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
## 2 基本概念
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

### 创建镜像
#### 修改已有镜像
#### 利用Dockerfile来创建镜像
#### 从本地文件系统导入
#### 上传镜像

### 存出和载入镜像
#### 存出镜像
#### 载入镜像

### 移除本地镜像

### 镜像的实现原理

## 5 Docker容器
### 启动容器
#### 新建并启动
#### 启动已终止的容器
### 守护态运行
### 终止容器
### 进入容器
#### attach
#### nsenter
### 导出和导入容器
#### 导出容器
#### 导入容器快照
### 删除容器
## 6 Docker仓库
## 7 Docker数据管理
## 8 Docker网络
## 9 高级网络配置
## 10 实战案例






