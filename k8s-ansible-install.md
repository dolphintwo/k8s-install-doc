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
registry0 ansible_host=<node2.ip> ansible_port=22

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
```

# 5.zookeeper安装
前置环境检验

|registry中镜像有|
|----|
|v4-zookeeper:3.4.9|

zookeeper是在node上浮动的，所以安装在任意节点即可
在任意节点创建zk-deployment
修改以下配置中的：
参数|备注
----|----
namespace|
node|为部署节点
```
vi one-zk-deployment.yaml
#创建deployment
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
        node: 10.26.7.85
    spec:
      hostname: zookeeper
      containers:
      - name: zookeeper
        image: 10.26.7.81:5000/newtouchone/v4-zookeeper:3.4.9 
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 2181
```
启动zk-deployment
```
kubectl create -f one-zk-deployment.yaml
```
创建zk-service
```
vi one-zk-service.yaml
#创建service
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
启动zk-service
```
kubectl create -f one-zk-service.yaml
```
# 6. 安装ceph

前置环境检验

|registry中镜像有|
|-----|
|ceph-daemon_latest|
|paas-ceph-wrapper_20161013|

## 6.1 启动MONITOER
修改以下配置中的：
参数|备注
----|----
IP地址|镜像仓库地址

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

## 6.2 启动ODS
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

