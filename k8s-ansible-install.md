# 1.免密登陆配置
## 1.1 设置主机名

主机|内网ip|外网ip|备注
-----|-----|-----|-----
proxy|172.21.4.3|218.245.66.213|登陆用
node1|172.21.7.11||
node2|172.21.7.13||
node3|172.21.7.14||
```
hostnamectl set-hostname <hostname>
```
设置完reboot服务器
## 1.2 免密登陆配置
### 1.2.1 修改hosts文件
```
vim /etc/hosts
#增加如下配置
172.21.7.11 node1
172.21.7.13 node2
172.21.7.14 node3
```
验证方法 安装机ping node1解析到ip
### 1.2.2 生成密钥
```
# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
/root/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
f7:fe:71:d0:c6:c9:f0:8c:14:f3:c4:74:20:13:9e:5b root@proxy
The key's randomart image is:
+--[ RSA 2048]----+
|            ++++.|
|           . +=..|
|            ooE. |
|            .o*o.|
|        S . ...=+|
|         . .   o |
|            . . .|
|           .   o |
|            ...  |
+-----------------+
#将公钥传输到每个节点服务器上
[@proxy]# scp .ssh/id_rsa.pub root@172.21.7.11:/tmp
#在节点上将公钥cat文件流输出到.ssh/authorized_keys，赋600权限
[@node1]# cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys
[@node1]# chmod 600 ~/.ssh/authorized_keys
```
*验证从ansible安装机到被安装机免密登陆*
# 2.内核升级

# 3.磁盘挂载

# 4.ansible安装k8s
前置条件
安装ansible
```
yum install epel-release
yum install ansible
```
## 4.1 clone ansible工程
```
git clone -b develop https://code.newtouch.com/newtouchone/k8s-ansible.git
```
## 4.2 进入工程files/下，下载依赖
```
cd k8s-ansible/files
sh download_dependence.sh
```
## 4.3 配置工程hosts文件
修改etcd,master,node节点信息
```
[etcdservers]
etcd0 ansible_host=<node1.ip> ansible_port=22 etcd_master=true
etcd1 ansible_host=<node2.ip> ansible_port=22
etcd2 ansible_host=<node3.ip> ansible_port=22

[kuber_master]
kuber0 ansible_host=<node1.ip> ansible_port=22

[kuber_node]
kuber0 ansible_host=<node1.ip> ansible_port=22
kuber1 ansible_host=<node2.ip> ansible_port=22
kuber2 ansible_host=<node3.ip> ansible_port=22

[kubernetes:children]
kuber_master
kuber_node

[kuber_and_etcd:children]
kubernetes
etcdservers

[registry]
registry0 ansible_host=<node1.ip> ansible_port=22

[kuber_node_and_registry:children]
kuber_node
registry

[kuber_addition_node]
## kuber2 ansible_host=<node3.ip> ansible_port=22
```
ansible依次执行安装
```
ansible-playbook -i hosts install_etcd.yml
ansible-playbook -i hosts install_k8s_master.yml
ansible-playbook -i hosts install_k8s_node.yml
ansible-playbook -i hosts install_registry.yml
ansible-playbook -i hosts install_k8s_addon.yml
```
*每一步执行都查看是否报错，ansible安装出错执行回滚*
```
ansible-playbook -i hosts uninstall.yml
```
registry安装后上传镜像到路径
```
/root/registry/
```

# 5.zookeeper安装
前置环境检验

|registry中镜像有|
|----|
|v4-zookeeper:3.4.9|
## 5.1 v4-zookeeper镜像上传
上传v4-zookeeper:3.4.9.tar到/root/registry下
```
#docker导入镜像
docker load < v4-zookeeper\:3.4.9.tar 
#重现tag镜像
docker tag 192.168.0.8:5000/newtouchone/v4-zookeeper:3.4.9 172.21.7.11:5000/newtouchone/v4-zookeeper:3.4.9
#删除旧镜像
docker rmi 192.168.0.8:5000/newtouchone/v4-zookeeper:3.4.9
#push镜像
docker push 172.21.7.11:5000/newtouchone/v4-zookeeper:3.4.9
```
*校验：/var/lib/docker/volumes/ff4ef67dd83019202083b0955ddef7493f68e94f0b65934c2c937698bedf2611/_data/docker/registry/v2/repositories/newtouchone下出现v4-zookeeper*
*校验2：docker pull 172.21.7.11:5000/newtouchone/v4-zookeeper:3.4.9*
## 5.2 zookeeper安装
zookeeper是在node上浮动的，所以安装在任意节点即可
在任意节点创建zk-deployment
修改以下配置中的：
参数|备注
----|----
namespace|
node|为部署节点
创建并启动namespace
```
vi one-namespace.yaml
```
```
apiVersion: v1  
kind: Namespace  
metadata:  
   name: newtouchone  
   labels:  
     name: newtouchone
```
```
>kubectl create -f one-namespace.yaml
namespace "newtouchone" created
```
创建并启动deployment
```
vi one-zk-deployment.yaml
```
```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: zookeeper
  namespace: newtouchone
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: zookeeper
        node: 172.21.7.11
    spec:
      hostname: zookeeper
      containers:
      - name: zookeeper
        image: 172.21.7.11:5000/newtouchone/v4-zookeeper:3.4.9 
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 2181
```

```
>kubectl create -f one-zk-deployment.yaml
deployment "zookeeper" created
```
创建并启动zk-service
```
vi one-zk-service.yaml
```
```
apiVersion: v1
kind: Service
metadata:
  name: zookeeper
  namespace: newtouchone
  labels:
    app: zookeeper
spec:
  selector:
    app: zookeeper
  type: NodePort
  ports:
  -port: 2181 
```
```
>kubectl create -f one-zk-service.yaml
service "zookeeper" created
```
============================下方未验证============================
# 6. 安装ceph

前置环境检验

|registry中镜像有|
|-----|
|ceph-daemon_latest|
|paas-ceph-wrapper_20161013|

## 6.1 启动MONITOER
修改以下配置中的：（下同）
|参数|备注|
|------|------|
|IP地址|镜像仓库地址|

```
docker run -d \
–net=host \
–restart always \
-v /etc/ceph:/etc/ceph \
-v /var/lib/ceph/:/var/lib/ceph/ \
-e MON_IP=10.26.7.86 \
-e CEPH_PUBLIC_NETWORK=10.26.7.1/16 \
10.26.7.81:5000/newtouchone/ceph-daemon mon
```
这里因为是单点部署，需要在CEPH配置文件（/etc/ceph/ceph.conf）添加以下参数
```
echo "
osd pool default size = 1
osd pool default min size = 1
osd crush chooseleaf type = 0
" >> /etc/ceph/ceph.conf
```
重启容器
```
docker restart {MONITOER容器ID}
```

## 6.2 启动MDS
```
docker run -d \
    –net=host \
    -v /etc/ceph:/etc/ceph \
    -v /var/lib/ceph/:/var/lib/ceph/ \
    -e CEPHFS_CREATE=1 \
    10.26.7.81:5000/newtouchone/ceph-daemon mds
```

## 6.3 启动ODS
```
docker run -d \
    –net=host \
    –privileged=true \
    -v /etc/ceph:/etc/ceph \
    -v /var/lib/ceph/:/var/lib/ceph/ \
    -v /dev/:/dev/ \
    -v /ceph:/var/lib/ceph/osd \
    10.26.7.81:5000/newtouchone/ceph-daemon osd_directory
```
*（注：挂载到/var/lib/ceph/osd的目录为实际数据盘存储目录，目录格式必须为xfs格式，一般使用物理机挂载的磁盘目录，例如物理机挂载500G磁盘至/ceph目录，那么这里volume的参数则设置为 -v /ceph:/var/lib/ceph/osd。ODS可根据磁盘容量需要，挂载多个磁盘）*

## 6.4 启动RGW
```
docker run -d \
 –net=host \
 –restart always \
 -v /etc/ceph:/etc/ceph \
 -v /var/lib/ceph/:/var/lib/ceph/ \
 -e RGW_CIVETWEB_PORT=7480 \
 10.26.7.81:5000/newtouchone/ceph-daemon rgw
#结果显示如下
4a7c507a40b5f2514a6e20b518679e1b877c238d1400a44ac38934e79e4d3d6d
#添加网关用户
docker exec -ti 4a7c507a40b5 radosgw-admin user create –uid="admin" –display-name="admin"
#结果显示如下
{
    "user_id": "admin",
    "display_name": "admin",
    "email": "",
    "suspended": 0,
    "max_buckets": 1000,
    "auid": 0,
    "subusers": [],
    "keys": [
        {
            "user": "admin",
            "access_key": "P8JUQ0E22YHSMC3G4Y1D",
            "secret_key": "kt2RS5CwFug28siGwOPZBAIVJDnmaLfTj5jEK36W"
        }
    ],
    "swift_keys": [],
    "caps": [],
    "op_mask": "read, write, delete",
    "default_placement": "",
    "placement_tags": [],
    "bucket_quota": {
        "enabled": false,
        "max_size_kb": -1,
        "max_objects": -1
    },
    "user_quota": {
        "enabled": false,
        "max_size_kb": -1,
        "max_objects": -1
    },
    "temp_url_keys": []
}
```
给网关用户授权
```
docker exec -ti 4a7c507a40b5 radosgw-admin  caps add –uid=admin –caps="users=*;buckets=*;metadata=*;usage=*;zone=*"
```

## 6.5 启动PAAS-CEPH-WRAPPER
```
docker run -d \
    -p 9080:8080 \
    -v /etc/ceph:/etc/ceph \
    10.26.7.81:5000/newtouchone/paas-ceph-wrapper:20161013
```
*（注：该应用为PAAS调用ceph接口做的转发器）*
镜像说明：对newtouch-paas/paas-system-wrapper项目进行打包（profile=boot），并将jar包放入Dockerfile（newtouch-paas/file/docker/paas-ceph-wrapper）中进行打包。

## 6.6 状态检查

进入paas-ceph-wrapper容器，执行命令检查ceph服务健康状态
```
ceph status
```


