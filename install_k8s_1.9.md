[TOC]
<!-- TOC -->

- [环境准备](#%E7%8E%AF%E5%A2%83%E5%87%86%E5%A4%87)
- [安装准备](#%E5%AE%89%E8%A3%85%E5%87%86%E5%A4%87)
    - [关闭selinux](#%E5%85%B3%E9%97%ADselinux)
    - [关闭swap](#%E5%85%B3%E9%97%ADswap)
    - [升级内核](#%E5%8D%87%E7%BA%A7%E5%86%85%E6%A0%B8)
    - [挂载磁盘](#%E6%8C%82%E8%BD%BD%E7%A3%81%E7%9B%98)
    - [安装docker](#%E5%AE%89%E8%A3%85docker)
- [证书准备](#%E8%AF%81%E4%B9%A6%E5%87%86%E5%A4%87)
    - [安装cfssl](#%E5%AE%89%E8%A3%85cfssl)
    - [创建etcd-ca证书](#%E5%88%9B%E5%BB%BAetcd-ca%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建集群CA证书](#%E5%88%9B%E5%BB%BA%E9%9B%86%E7%BE%A4ca%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建admin证书](#%E5%88%9B%E5%BB%BAadmin%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建api-server证书](#%E5%88%9B%E5%BB%BAapi-server%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建front-proxy证书](#%E5%88%9B%E5%BB%BAfront-proxy%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建Controller Manager证书](#%E5%88%9B%E5%BB%BAcontroller-manager%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建kube-scheduler证书](#%E5%88%9B%E5%BB%BAkube-scheduler%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建kubelet证书](#%E5%88%9B%E5%BB%BAkubelet%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建kube-proxy证书](#%E5%88%9B%E5%BB%BAkube-proxy%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
    - [创建xxxxxx证书](#%E5%88%9B%E5%BB%BAxxxxxx%E8%AF%81%E4%B9%A6)
        - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [生成证书](#%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A6)
- [安装etcd](#%E5%AE%89%E8%A3%85etcd)
    - [准备](#%E5%87%86%E5%A4%87)
    - [启动etcd服务](#%E5%90%AF%E5%8A%A8etcd%E6%9C%8D%E5%8A%A1)
    - [验证etcd可用性](#%E9%AA%8C%E8%AF%81etcd%E5%8F%AF%E7%94%A8%E6%80%A7)
- [安装Kubernetes Master](#%E5%AE%89%E8%A3%85kubernetes-master)
    - [准备](#%E5%87%86%E5%A4%87)
    - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [Bootstrap Token](#bootstrap-token)
        - [bootstrap.conf](#bootstrapconf)
        - [admin.conf](#adminconf)
        - [controller-manager.conf](#controller-managerconf)
        - [scheduler-csr.json](#scheduler-csrjson)
        - [kubelet.conf](#kubeletconf)
        - [Service account key](#service-account-key)
        - [kube-proxy.conf](#kube-proxyconf)
    - [文件检查](#%E6%96%87%E4%BB%B6%E6%A3%80%E6%9F%A5)
    - [启动](#%E5%90%AF%E5%8A%A8)
    - [验证](#%E9%AA%8C%E8%AF%81)
- [安装Kubernetes Node](#%E5%AE%89%E8%A3%85kubernetes-node)
    - [准备](#%E5%87%86%E5%A4%87)
    - [配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
    - [启动](#%E5%90%AF%E5%8A%A8)
    - [验证](#%E9%AA%8C%E8%AF%81)

<!-- /TOC -->
# 环境准备
|ip|hostname|use|addition|
|--|--|--|--|
|192.168.216.157|node1|master,node|centos7|
|192.168.216.158|node2|node|centos7|
|192.168.216.159|node3|node|centos7|

# 安装准备
## 关闭selinux
```bash
$ vim /etc/sysconfig/selinux
```
## 关闭swap
```bash
$ swapoff -a
$ vim /etc/fstab
#删除swap挂载的那一行
```
把SELINUX改成disabled，然后保存退出。
## 升级内核
```bash
$ rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm ;yum --enablerepo=elrepo-kernel install kernel-lt-devel kernel-lt -y
$ awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg
CentOS Linux (4.4.108-1.el7.elrepo.x86_64) 7 (Core)
CentOS Linux (3.10.0-693.11.1.el7.x86_64) 7 (Core)
CentOS Linux (3.10.0-693.el7.x86_64) 7 (Core)
CentOS Linux (0-rescue-155889dfbf174a6aa0a1b5c773f09eef) 7 (Core)
$ grub2-set-default 0 
$ reboot now
$ uname -a
Linux node1 4.4.108-1.el7.elrepo.x86_64 #1 SMP Mon Dec 25 09:55:39 EST 2017 x86_64 x86_64 x86_64 GNU/Linux
```
## 挂载磁盘
|磁盘|用途|格式|大小|
|--|--|--|--|
|/dev/sda|系统盘|--|10g|
|/dev/sdb|gluster|xfs|10g|

## 安装docker
```bash
$ yum install -y docker
$ systemctl enable docker
#配置dockerhub国内加速
$ cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn", "hub-mirror.c.163.com","https://omrhxrz9.mirror.aliyuncs.com"],
  "graph":"/mnt/docker", 
  "storage-driver": "overlay2"
}
EOF
$ systemctl daemon-reload
#解决centos7路由失败
$ cat <<EOF > /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
$ sysctl -p /etc/sysctl.d/k8s.conf
$ systemctl start docker
```

# 证书准备
## 安装cfssl
```bash
[root@node1 ssl]# wget https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 -O /usr/local/bin/cfssl
[root@node1 ssl]# wget https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 -O /usr/local/bin/cfssljson
[root@node1 ssl]# chmod +x /usr/local/bin/cfssl /usr/local/bin/cfssljson
```

## 创建etcd-ca证书
### 配置文件
- etcd-ca-csr.json
- ca-config.json
- etcd-csr.json
### 生成证书
```bash
[root@node1 ssljson]# cfssl gencert -initca etcd-ca-csr.json | cfssljson -bare etcd-ca
2017/12/27 20:03:17 [INFO] generating a new CA key and certificate from CSR
2017/12/27 20:03:17 [INFO] generate received request
2017/12/27 20:03:17 [INFO] received CSR
2017/12/27 20:03:17 [INFO] generating key: rsa-2048
2017/12/27 20:03:17 [INFO] encoded CSR
2017/12/27 20:03:17 [INFO] signed certificate with serial number 698722868226288868738416201607380433299807036327
[root@node1 ssljson]# ls etcd-ca*.pem
etcd-ca-key.pem  etcd-ca.pem
[root@node1 ssljson]# cfssl gencert \
> -ca=etcd-ca.pem \
> -ca-key=etcd-ca-key.pem \
> -config=ca-config.json \
> -profile=kubernetes \
> etcd-csr.json | cfssljson -bare etcd
2017/12/27 20:06:29 [INFO] generate received request
2017/12/27 20:06:29 [INFO] received CSR
2017/12/27 20:06:29 [INFO] generating key: rsa-2048
2017/12/27 20:06:29 [INFO] encoded CSR
2017/12/27 20:06:29 [INFO] signed certificate with serial number 43470713069582880614255059076480260055025874122
2017/12/27 20:06:29 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
[root@node1 ssljson]# ls etcd*.pem
etcd-ca-key.pem  etcd-ca.pem  etcd-key.pem  etcd.pem
```

## 创建集群CA证书
### 配置文件
- ca-config.json
- ca-csr.json
### 生成证书
```bash
[root@node1 ssljson]# cfssl gencert -initca ca-csr.json | cfssljson -bare ca
2017/12/27 19:15:23 [INFO] generating a new CA key and certificate from CSR
2017/12/27 19:15:23 [INFO] generate received request
2017/12/27 19:15:23 [INFO] received CSR
2017/12/27 19:15:23 [INFO] generating key: rsa-2048
2017/12/27 19:15:23 [INFO] encoded CSR
2017/12/27 19:15:23 [INFO] signed certificate with serial number 315014973138061896174002416216948890756728654806
[root@node1 ssljson]# ls ca*
ca-config.json  ca.csr  ca-csr.json  ca-key.pem  ca.pem
```
## 创建admin证书
### 配置文件
- admin-csr.json
### 生成证书
```bash
[root@node1 ssljson]# cfssl gencert -ca=/root/install/ssljson/ca.pem \
> -ca-key=/root/install/ssljson/ca-key.pem \
> -config=/root/install/ssljson/ca-config.json \
> -profile=kubernetes admin-csr.json | cfssljson -bare admin
2017/12/27 19:37:52 [INFO] generate received request
2017/12/27 19:37:52 [INFO] received CSR
2017/12/27 19:37:52 [INFO] generating key: rsa-2048
2017/12/27 19:37:53 [INFO] encoded CSR
2017/12/27 19:37:53 [INFO] signed certificate with serial number 391655371369257055773859351741079672614472921347
2017/12/27 19:37:53 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
[root@node1 ssljson]# ls admin*
admin.csr  admin-csr.json  admin-key.pem  admin.pem
```
## 创建api-server证书
### 配置文件
- apiserver-csr.json
### 生成证书
```bash
[root@node1 ssljson]# cfssl gencert \
> -ca=ca.pem \
> -ca-key=ca-key.pem \
> -config=ca-config.json \
> -hostname=10.96.0.1,192.168.216.160,127.0.0.1,kubernetes.default \
> -profile=kubernetes \
> apiserver-csr.json | cfssljson -bare apiserver
2017/12/28 02:25:26 [INFO] generate received request
2017/12/28 02:25:26 [INFO] received CSR
2017/12/28 02:25:26 [INFO] generating key: rsa-2048
2017/12/28 02:25:26 [INFO] encoded CSR
2017/12/28 02:25:26 [INFO] signed certificate with serial number 309218494224987789912381888423306528851508527515
[root@node1 ssljson]# ls apiserver*
apiserver.csr  apiserver-csr.json  apiserver-key.pem  apiserver.pem
```

## 创建front-proxy证书
### 配置文件
- front-proxy-ca-csr.json
- front-proxy-client-csr.json
### 生成证书
```bash
[root@node1 ssljson]# cfssl gencert \
> -initca front-proxy-ca-csr.json | cfssljson -bare front-proxy-ca
2017/12/28 18:11:45 [INFO] generating a new CA key and certificate from CSR
2017/12/28 18:11:45 [INFO] generate received request
2017/12/28 18:11:45 [INFO] received CSR
2017/12/28 18:11:45 [INFO] generating key: rsa-2048
2017/12/28 18:11:45 [INFO] encoded CSR
2017/12/28 18:11:45 [INFO] signed certificate with serial number 376012198440781044523886581273915678023470469966
[root@node1 ssljson]# ls front-proxy-ca*
front-proxy-ca.csr  front-proxy-ca-csr.json  front-proxy-ca-key.pem  front-proxy-ca.pem
[root@node1 ssljson]# cfssl gencert \
> -ca=front-proxy-ca.pem \
> -ca-key=front-proxy-ca-key.pem \
> -config=ca-config.json \
> -profile=kubernetes \
> front-proxy-client-csr.json | cfssljson -bare front-proxy-client
2017/12/28 18:14:39 [INFO] generate received request
2017/12/28 18:14:39 [INFO] received CSR
2017/12/28 18:14:39 [INFO] generating key: rsa-2048
2017/12/28 18:14:39 [INFO] encoded CSR
2017/12/28 18:14:39 [INFO] signed certificate with serial number 220754379899007271860807053283494701550791175575
2017/12/28 18:14:39 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
[root@node1 ssljson]# ls front-proxy-client*
front-proxy-client.csr  front-proxy-client-csr.json  front-proxy-client-key.pem  front-proxy-client.pem
```
## 创建Controller Manager证书
### 配置文件
- manager-csr.json
### 生成证书
```
[root@node1 ssljson]# cfssl gencert \
> -ca=ca.pem \
> -ca-key=ca-key.pem \
> -config=ca-config.json \
> -profile=kubernetes \
> manager-csr.json | cfssljson -bare controller-manager
2017/12/29 13:39:29 [INFO] generate received request
2017/12/29 13:39:29 [INFO] received CSR
2017/12/29 13:39:29 [INFO] generating key: rsa-2048
2017/12/29 13:39:29 [INFO] encoded CSR
2017/12/29 13:39:29 [INFO] signed certificate with serial number 75987879826893257923999636218833114657575595919
2017/12/29 13:39:29 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
[root@node1 ssljson]# ls controller-manager*.pem
controller-manager-key.pem  controller-manager.pem
```
## 创建kube-scheduler证书
### 配置文件
- scheduler-csr.json
### 生成证书
```bash
[root@node1 ssljson]# cfssl gencert \
> -ca=ca.pem \
> -ca-key=ca-key.pem \
> -config=ca-config.json \
> -profile=kubernetes \
> scheduler-csr.json | cfssljson -bare scheduler
2017/12/29 14:30:50 [INFO] generate received request
2017/12/29 14:30:50 [INFO] received CSR
2017/12/29 14:30:50 [INFO] generating key: rsa-2048
2017/12/29 14:30:51 [INFO] encoded CSR
2017/12/29 14:30:51 [INFO] signed certificate with serial number 567767950275805323088506019561988525318249579806
2017/12/29 14:30:51 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
[root@node1 ssljson]# ls scheduler*.pem
scheduler-key.pem  scheduler.pem
```
## 创建kubelet证书
### 配置文件
- kubelet-csr.json
### 生成证书
```bash
[root@node1 ssljson]# cfssl gencert \
> -ca=ca.pem \
> -ca-key=ca-key.pem \
> -config=ca-config.json \
> -hostname=node1,192.168.216.160 \
> -profile=kubernetes \
> kubelet-csr.json | cfssljson -bare kubelet
2017/12/29 15:11:19 [INFO] generate received request
2017/12/29 15:11:19 [INFO] received CSR
2017/12/29 15:11:19 [INFO] generating key: rsa-2048
2017/12/29 15:11:20 [INFO] encoded CSR
2017/12/29 15:11:20 [INFO] signed certificate with serial number 609425088022624615409855021723045416826198261636
[root@node1 ssljson]# ls kubelet*
kubelet.csr  kubelet-csr.json  kubelet-key.pem  kubelet.pem
```
## 创建kube-proxy证书
### 配置文件
- kube-proxy-csr.json
### 生成证书
```bash
[root@node1 ssl]# cfssl gencert \
> -ca=ca.pem \
> -ca-key=ca-key.pem \
> -config=ca-config.json \
> -profile=kubernetes \
> kube-proxy-csr.json | cfssljson -bare kube-proxy
2017/12/29 15:59:05 [INFO] generate received request
2017/12/29 15:59:05 [INFO] received CSR
2017/12/29 15:59:05 [INFO] generating key: rsa-2048
2017/12/29 15:59:06 [INFO] encoded CSR
2017/12/29 15:59:06 [INFO] signed certificate with serial number 186279084399730497569855923743077101174133449302
2017/12/29 15:59:06 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
[root@node1 ssl]# ls kube-proxy*.pem
kube-proxy-key.pem  kube-proxy.pem
```

## 创建xxxxxx证书
### 配置文件
### 生成证书


```

```
# 安装etcd
## 准备
```
[root@node1 etcd]# wget https://github.com/coreos/etcd/releases/download/v3.2.12/etcd-v3.2.12-linux-amd64.tar.gz
[root@node1 etcd]# tar zxvf etcd-v3.2.12-linux-amd64.tar.gz
[root@node1 etcd]# cp etcd-v3.2.12-linux-amd64/etcd* /usr/local/bin/
[root@node1 etcd]# mkdir -p /etc/etcd/ssl
[root@node1 etcd]# cp /root/install/ssl/{etcd-ca.csr,etcd-ca-key.pem,etcd-ca.pem,etcd.csr,etcd-key.pem,etcd.pem} /etc/etcd/ssl/
[root@node1 etcd]# groupadd etcd
[root@node1 etcd]# useradd -c "Etcd user" -g etcd -s /sbin/nologin -r etcd
[root@node1 etcd]# mkdir -p /var/lib/etcd
[root@node1 etcd]# chown etcd:etcd -R /var/lib/etcd /etc/etcd
## 配置文件
```
- etcd.conf
```bash
[root@node1 etcd]# cat /etc/etcd/etcd.conf
# [member]
ETCD_NAME=node1
ETCD_DATA_DIR=/var/lib/etcd
ETCD_LISTEN_PEER_URLS=https://0.0.0.0:2380
ETCD_LISTEN_CLIENT_URLS=https://0.0.0.0:2379
ETCD_PROXY=off

# [cluster]
ETCD_ADVERTISE_CLIENT_URLS=https://192.168.216.160:2379
ETCD_INITIAL_ADVERTISE_PEER_URLS=https://192.168.216.160:2380
ETCD_INITIAL_CLUSTER=node1=https://192.168.216.160:2380
ETCD_INITIAL_CLUSTER_STATE=new
ETCD_INITIAL_CLUSTER_TOKEN=etcd-k8s-cluster

# [security]
ETCD_CERT_FILE="/etc/etcd/ssl/etcd.pem"
ETCD_KEY_FILE="/etc/etcd/ssl/etcd-key.pem"
ETCD_CLIENT_CERT_AUTH="true"
ETCD_TRUSTED_CA_FILE="/etc/etcd/ssl/etcd-ca.pem"
ETCD_AUTO_TLS="true"
ETCD_PEER_CERT_FILE="/etc/etcd/ssl/etcd.pem"
ETCD_PEER_KEY_FILE="/etc/etcd/ssl/etcd-key.pem"
ETCD_PEER_CLIENT_CERT_AUTH="true"
ETCD_PEER_TRUSTED_CA_FILE="/etc/etcd/ssl/etcd-ca.pem"
ETCD_PEER_AUTO_TLS="true"
```
- etcd.service
```bash
[root@node1 etcd]# cat /lib/systemd/system/etcd.service
[Unit]
Description=Etcd Service
After=network.target

[Service]
Environment=ETCD_DATA_DIR=/var/lib/etcd/default
EnvironmentFile=-/etc/etcd/etcd.conf
Type=notify
User=etcd
PermissionsStartOnly=true
ExecStart=/usr/local/bin/etcd
Restart=on-failure
RestartSec=10
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
```
## 启动etcd服务
```bash
[root@node1 ~]# systemctl enable etcd.service
Created symlink from /etc/systemd/system/multi-user.target.wants/etcd.service to /usr/lib/systemd/system/etcd.service.
[root@node1 ~]# systemctl start etcd.service
[root@node1 ~]# systemctl status etcd.service
● etcd.service - Etcd Service
  Loaded: loaded (/usr/lib/systemd/system/etcd.service; enabled; vendor preset: disabled)
  Active: active (running) since 四 2017-12-28 01:16:50 CST; 8s ago
Main PID: 12418 (etcd)
  CGroup: /system.slice/etcd.service
          └─12418 /usr/local/bin/etcd

12月 28 01:16:50 node1 etcd[12418]: raft.node: dae49f7883ac447b elected leader dae49f7883ac447b at term 2
12月 28 01:16:50 node1 etcd[12418]: published {Name:node1 ClientURLs:[https://192.168.216.160:2379...dce8
12月 28 01:16:50 node1 etcd[12418]: setting up the initial cluster version to 3.2
12月 28 01:16:50 node1 etcd[12418]: ready to serve client requests
12月 28 01:16:50 node1 etcd[12418]: dialing to target with scheme: ""
12月 28 01:16:50 node1 etcd[12418]: could not get resolver for scheme: ""
12月 28 01:16:50 node1 etcd[12418]: serving client requests on [::]:2379
12月 28 01:16:50 node1 systemd[1]: Started Etcd Service.
12月 28 01:16:50 node1 etcd[12418]: set the initial cluster version to 3.2
12月 28 01:16:50 node1 etcd[12418]: enabled capabilities for version 3.2
Hint: Some lines were ellipsized, use -l to show in full.
```
## 验证etcd可用性
```bash
[root@node1 ~]# ETCDCTL_API=3 etcdctl \
> --cacert=/etc/etcd/ssl/etcd-ca.pem \
> --cert=/etc/etcd/ssl/etcd.pem \
> --key=/etc/etcd/ssl/etcd-key.pem \
> --endpoints="https://192.168.216.160:2379" \
> endpoint health
https://192.168.216.160:2379 is healthy: successfully committed proposal: took = 602.329µs
```

# 安装Kubernetes Master
## 准备
```
[root@node1 kubernetes]# wget https://storage.googleapis.com/kubernetes-release/release/v1.9.0/kubernetes-server-linux-amd64.tar.gz
[root@node1 kubernetes]# tar zxvf kubernetes-server-linux-amd64.tar.gz
[root@node1 kubernetes]# cp -r kubernetes/server/bin/{kubelet,kubectl,kube-proxy,kube-apiserver,kube-controller-manager,kube-scheduler} /usr/local/bin/
[root@node1 kubernetes]# chmod +x /usr/local/bin/kube*
[root@node1 kubernetes]# mkdir /root/install/cni && cd /root/install/cni
[root@node1 cni]# wget https://github.com/containernetworking/plugins/releases/download/v0.6.0/cni-plugins-amd64-v0.6.0.tgz
[root@node1 cni]# tar zxvf cni-plugins-amd64-v0.6.0.tgz
```
## 配置文件
### Bootstrap Token
由于通过手动创建 CA 方式太过繁杂，只适合少量机器，因为每次签证时都需要绑定 Node IP，随机器增加会带来很多困扰，因此这边使用 TLS Bootstrapping 方式进行授权，由 apiserver 自动给符合条件的 Node 发送证书来授权加入集群。

主要做法是 kubelet 启动时，向 kube-apiserver 传送 TLS Bootstrapping 请求，而 kube-apiserver 验证 kubelet 请求的 token 是否与设定的一样，若一样就自动产生 kubelet 证书与密钥。具体作法可以参考 [TLS bootstrapping](http://docs.kubernetes.org.cn/698.html)。

首先建立一个变量来产生BOOTSTRAP_TOKEN，并建立 bootstrap.conf 的 kubeconfig 文件：
- 生成16位随机`BOOTSTRAP_TOKEN`
```
[root@node1 ~]# head -c 16 /dev/urandom | od -An -t x | tr -d ' '
52017800c2edb07e125168de04543ce6
```

- token.csv
```bash
[root@node1 ~]# cat /etc/kubernetes/token.csv
52017800c2edb07e125168de04543ce6,kubelet-bootstrap,10001,"system:kubelet-bootstrap"
```
### bootstrap.conf
```
# bootstrap set-cluster
[root@node1 ssl]# kubectl config set-cluster kubernetes \
> --certificate-authority=/etc/kubernetes/ssl/ca.pem \
> --embed-certs=true \
> --server=192.168.216.160 \
> --kubeconfig=/etc/kubernetes/bootstrap.conf
Cluster "kubernetes" set.

# bootstrap set-credentials
[root@node1 ssl]# kubectl config set-credentials kubelet-bootstrap \
> --token=52017800c2edb07e125168de04543ce6 \
> --kubeconfig=/etc/kubernetes/bootstrap.conf
User "kubelet-bootstrap" set.

# bootstrap set-context
[root@node1 ssl]# kubectl config set-context default \
> --cluster=kubernetes \
> --user=kubelet-bootstrap \
> --kubeconfig=/etc/kubernetes/bootstrap.conf
Context "default" created.

# bootstrap set default context
[root@node1 ssl]# kubectl config use-context default --kubeconfig=/etc/kubernetes/bootstrap.conf
Switched to context "default".
```
### admin.conf
```
# admin set-cluster
[root@node1 ssl]# kubectl config set-cluster kubernetes \
> --certificate-authority=/etc/kubernetes/ssl/ca.pem \
> --embed-certs=true \
> --server=192.168.216.160 \
> --kubeconfig=/etc/kubernetes/admin.conf
Cluster "kubernetes" set.

# admin set-credentials
[root@node1 ssl]# kubectl config set-credentials kubernetes-admin \
> --client-certificate=/etc/kubernetes/ssl/admin.pem \
> --client-key=/etc/kubernetes/ssl/admin-key.pem \
> --embed-certs=true \
> --kubeconfig=/etc/kubernetes/admin.conf
User "kubernetes-admin" set.

# admin set-context
[root@node1 ssl]# kubectl config set-context kubernetes-admin@kubernetes \
> --cluster=kubernetes \
> --user=kubernetes-admin \
> --kubeconfig=/etc/kubernetes/admin.conf
Context "kubernetes-admin@kubernetes" created.

# admin set default context
[root@node1 ssl]# kubectl config use-context kubernetes-admin@kubernetes \
> --kubeconfig=/etc/kubernetes/admin.conf
Switched to context "kubernetes-admin@kubernetes".
```
### controller-manager.conf
```bash
# controller-manager set-cluster
[root@node1 ssl]# kubectl config set-cluster kubernetes \
> --certificate-authority=/etc/kubernetes/ssl/ca.pem \
> --embed-certs=true \
> --server=192.168.216.160 \
> --kubeconfig=/etc/kubernetes/controller-manager.conf
Cluster "kubernetes" set.

# controller-manager set-credentials
[root@node1 ssl]# kubectl config set-credentials system:kube-controller-manager \
> --client-certificate=/etc/kubernetes/ssl/controller-manager.pem \
> --client-key=/etc/kubernetes/ssl/controller-manager-key.pem \
> --embed-certs=true \
> --kubeconfig=/etc/kubernetes/controller-manager.conf
User "system:kube-controller-manager" set.

# controller-manager set-context
[root@node1 ssl]# kubectl config set-context system:kube-controller-manager@kubernetes \
> --cluster=kubernetes \
> --user=system:kube-controller-manager \
> --kubeconfig=/etc/kubernetes/controller-manager.conf
Context "system:kube-controller-manager@kubernetes" created.

# controller-manager set default context
[root@node1 ssl]# kubectl config use-context system:kube-controller-manager@kubernetes \
> --kubeconfig=/etc/kubernetes/controller-manager.conf
Switched to context "system:kube-controller-manager@kubernetes".
```
### scheduler-csr.json
```bash
# scheduler set-cluster
[root@node1 ssl]# kubectl config set-cluster kubernetes \
> --certificate-authority=/etc/kubernetes/ssl/ca.pem \
> --embed-certs=true \
> --server=192.168.216.160 \
> --kubeconfig=/etc/kubernetes/scheduler.conf
Cluster "kubernetes" set.

# scheduler set-credentials
[root@node1 ssl]# kubectl config set-credentials system:kube-scheduler \
> --client-certificate=/etc/kubernetes/ssl/scheduler.pem \
> --client-key=/etc/kubernetes/ssl/scheduler-key.pem \
> --embed-certs=true \
> --kubeconfig=/etc/kubernetes/scheduler.conf
User "system:kube-scheduler" set.

# scheduler set-context
[root@node1 ssl]# kubectl config set-context system:kube-scheduler@kubernetes \
> --cluster=kubernetes \
> --user=system:kube-scheduler \
> --kubeconfig=/etc/kubernetes/scheduler.conf
Context "system:kube-scheduler@kubernetes" created.

# scheduler set default context
[root@node1 ssl]# kubectl config use-context system:kube-scheduler@kubernetes \
> --kubeconfig=/etc/kubernetes/scheduler.conf
Switched to context "system:kube-scheduler@kubernetes".
```
### kubelet.conf
```bash
# kubelet set-cluster
[root@node1 ssl]# kubectl config set-cluster kubernetes \
> --certificate-authority=/etc/kubernetes/ssl/ca.pem \
> --embed-certs=true \
> --server=192.168.216.160 \
> --kubeconfig=/etc/kubernetes/kubelet.conf
Cluster "kubernetes" set.
# kubelet set-credentials
[root@node1 ssl]# kubectl config set-credentials system:node:node1 \
> --client-certificate=/etc/kubernetes/ssl/kubelet.pem \
> --client-key=/etc/kubernetes/ssl/kubelet-key.pem \
> --embed-certs=true \
> --kubeconfig=/etc/kubernetes/kubelet.conf
User "system:node:node1" set.
# kubelet set-context
[root@node1 ssl]# kubectl config set-context system:node:node1@kubernetes \
> --cluster=kubernetes \
> --user=system:node:node1 \
> --kubeconfig=/etc/kubernetes/kubelet.conf
Context "system:node:node1@kubernetes" created.
# kubelet set default context
[root@node1 ssl]# kubectl config use-context system:node:node1@kubernetes \
> --kubeconfig=/etc/kubernetes/kubelet.conf
Switched to context "system:node:node1@kubernetes".
```
### Service account key
```bash
[root@node1 ssl]# openssl genrsa -out sa.key 2048
Generating RSA private key, 2048 bit long modulus
..................................+++
................................................................................+++
e is 65537 (0x10001)
[root@node1 ssl]# openssl rsa -in sa.key -pubout -out sa.pub
writing RSA key
[root@node1 ssl]# ls sa.*
sa.key  sa.pub
```
### kube-proxy.conf
```bash
# kube-proxy set-cluster
[root@node1 ssl]# kubectl config set-cluster kubernetes \
> --certificate-authority=/etc/kubernetes/ssl/ca.pem \
> --embed-certs=true \
> --server="https://192.168.216.160:6443" \
> --kubeconfig=/etc/kubernetes/kube-proxy.conf
Cluster "kubernetes" set.

# kube-proxy set-credentials
[root@node1 ssl]# kubectl config set-credentials system:kube-proxy \
> --client-key=/etc/kubernetes/ssl/kube-proxy-key.pem \
> --client-certificate=kube-proxy.pem \
> --embed-certs=true \
> --kubeconfig=/etc/kubernetes/kube-proxy.conf
User "system:kube-proxy" set.

# kube-proxy set-context
[root@node1 ssl]# kubectl config set-context system:kube-proxy@kubernetes \
> --cluster=kubernetes \
> --user=system:kube-proxy \
> --kubeconfig=/etc/kubernetes/kube-proxy.conf
Context "system:kube-proxy@kubernetes" created.

# kube-proxy set default context
[root@node1 ssl]# kubectl config use-context system:kube-proxy@kubernetes \
> --kubeconfig=/etc/kubernetes/kube-proxy.conf
Switched to context "system:kube-proxy@kubernetes".
```
## 文件检查
```bash
[root@node1 ssl]# ls /etc/kubernetes/
admin.conf      controller-manager.conf  scheduler.conf  token.csv
bootstrap.conf  kubelet.conf             ssl
[root@node1 ssl]# ls /etc/kubernetes/ssl/
admin-key.pem      controller-manager-key.pem  front-proxy-ca-key.pem      sa.key
admin.pem          controller-manager.pem      front-proxy-ca.pem          sa.pub
apiserver-key.pem  etcd-ca-key.pem             front-proxy-client-key.pem  scheduler-key.pem
apiserver.pem      etcd-ca.pem                 front-proxy-client.pem      scheduler.pem
ca-key.pem         etcd-key.pem                kubelet-key.pem
ca.pem             etcd.pem                    kubelet.pem
```

## 启动
## 验证

# 安装Kubernetes Node
## 准备
## 配置文件
## 启动
## 验证
