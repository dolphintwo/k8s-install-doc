# 1.免密登陆配置 #
## 1.1 设置主机名 #

主机|内网ip|外网ip|备注
-----|-----|-----|-----
proxy|172.21.4.3|218.245.66.213|登陆用
node1|172.21.7.11||
node2|172.21.7.13||
node3|172.21.7.14||
```
hostnamectl set-hostname <hostname>
```
## 1.2 免密登陆配置 #
### 1.2.1 修改hosts文件 #
```
vim /etc/hosts
#增加如下配置
172.21.7.11 node1
172.21.7.13 node2
172.21.7.14 node3
```
### 1.2.2 生成密钥 #
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
验证从ansible安装机到被安装机免密登陆
# 2.内核升级 #

# 3.磁盘挂载 #

# 4.ansible下载与配置 #
## 4.1 clone ansible工程 #
```
git clone -b develop https://code.newtouch.com/newtouchone/k8s-ansible.git
```
## 4.2 进入工程files/下，下载依赖 #
```
cd k8s-ansible/files
sh download_dependence.sh
```
## 4.3 配置工程hosts文件 #
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
## kuber2 ansible_host=<node3.ip> ansible_port=22

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


