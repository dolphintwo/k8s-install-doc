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
cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys

chmod 600 ~/.ssh/authorized_keys
```
*验证从ansible安装机到被安装机免密登陆*
# 2.内核升级
*验证内核版本*

# 3.磁盘挂载

# 4.ansible安装k8s
前置条件
安装ansible
```
yum install -y epel-release
yum install -y ansible
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
#以最新文件为准
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
ansible-playbook -i hosts install_ceph.yml
ansible-playbook -i hosts install_one_components.yml

```



删除addon安装
登陆到master节点
```
cd kube_addon
kubectl delete -f dashboard/
kubectl delete -f dns/
kubectl delete -f heapster/
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
# 6. 安装proxy
172.21.7.11:5000/newtouchone/one-nginx:1.0
++++问题++++
# 7. 安装ceph

ceph采用ansible安装，安装前需要将文件系统格式化成xfs

安装完成状态检查：

进入paas-ceph-wrapper容器，执行命令检查ceph服务健康状态
```
ceph status
```
# 8. 部署数据库（ceph）
## 准备工作：创建Ceph Pool
在ceph服务端使用下列命令，为Ceph 创建连接池 
docker ps查看paas-system-wrapper容器ID（可通过COMMAND命令确认，值为/entrypoint.sh osd_d）
```
$ ceph osd pool create paas 8 8
pool 'paas' created
$ docker ps
CONTAINER ID        IMAGE                                                     COMMAND                  CREATED            STATUS              PORTS                    NAMES
a991efc349ce        172.21.7.11:5000/newtouchone/paas-ceph-wrapper:20161013   "java -jar paas-syste"   2 days ago          Up 2 days           0.0.0.0:9080->8080/tcp   ceph-wrapper
```
**PS说明:**
`paas` 连接池pool的名称【默认】
两个`8`分别为，前`8`为PG数量，后`8`为PGP数量

## 部署mysql
使用下列命令创建mysql镜像。
`docker ps`查看paas-system-wrapper容器ID（可通过`COMMAND `命令确认，值为`java -jar paas-syste`）
```
$ rbd create mysqlpaas --size 2048 --pool paas
#重设镜像块大小
$ rbd resize mysqlpaas --size 4096 --pool paas
Resizing image: 100% complete...done.
```
**PS说明：**
`mysqlpaas `为镜像名称
`2048` 为存储大小
`paas`为准备工作中的连接池名
- k8s 创建ceph Secret
> 使用的yaml文件代码；参见：https://git.newtouch.com/newtouch-one/nbo-deploy-resource/blob/master/k8s/cephsecret.yaml
```
apiVersion: v1 
kind: Secret 
metadata: 
    name: ceph-secret-newtouch-one 
    namespace: newtouchone 
data: 
    key: QVFCRnVTNVkreFJEQkJBQXlvWE1JNDhlcE9wUmR2TlJJSTFtMmc9PQ==
```
**PS说明：**
`key`的值为ceph用户的key值对应的Base64编码值。
可在CEPH服务端中的/etc/ceph查看对应用户的密钥。
此处使用默认用户admin，因此使用/etc/ceph/ceph.client.admin.keyring文件中的key，使用base64加密工具进行加密作为yaml中的key值
（Base64加密链接：http://tool.chinaz.com/Tools/Base64.aspx）
- k8s 创建mysql ConfigMap
> 安装ConfigMap 的yaml文件代码；参见：https://git.newtouch.com/newtouch-one/nbo-deploy-resource/blob/master/k8s/mysql/mysql-configmap.yaml
```
apiVersion: v1 
kind: ConfigMap 
metadata: 
    name: mysql-config 
    namespace: newtouchone
    labels: 
    instanceId: paas-mysql 
    paas: paas 
data: 
    my-cnf: |
        [mysqld] 
        log-bin=mysql-bin 
        server-id=1 
        skip-host-cache 
        skip-name-resolve 
        datadir = /var/lib/mysql
        lower_case_table_names = 1
        character_set_server = utf8
        [client]
        default-character-set = utf8
        !includedir /etc/mysql/conf.d/
```
- k8s 创建RC
> RC 的yaml文件代码；参见：https://git.newtouch.com/newtouch-one/nbo-deploy-resource/blob/master/k8s/mysql/mysql-rc.yaml
```
apiVersion: v1
kind: ReplicationController
metadata:
  name: paas-mysql
  namespace: newtouchone
  labels:
    instanceId: paas-mysql
    instanceEngineType: MySQL
    paas: paas
spec:
  replicas: 1
  selector:
    instanceId: paas-mysql
  template:
    metadata:
      name: paas-mysql
      namespace: newtouchone
      labels:
        instanceId: paas-mysql
        instanceEngineType: MySQL
        paas: paas
    spec:
      volumes:
      - name: rbd-vol
        rbd:
          monitors:
            - 172.28.1.231:6789
          pool: paas
          image: mysqlpaas
          user: admin
          secretRef:
              name: ceph-secret-newtouch-one
          fsType: ext4
          readOnly: false
      - name: mysql-config-vol
        configMap:
          name: mysql-config
          items:
          - key: my-cnf
            path: my.cnf
      containers:
      - name: paas-mysql
        image: 172.21.7.11:5000/newtouchone/mysql:5.7
        resources:
          limits:
            memory: "1024M"
            cpu: "1"
        ports:
        - containerPort: 3306
        volumeMounts:
        - name: rbd-vol
          mountPath: /var/lib/mysql
        - name: mysql-config-vol
          mountPath: /mysqlConfig
        env:
        - name: FALCON_HOSTNAME
          value: newtouch-paas-mysql
        - name: FALCON_HEARTBEAT_URL
          value: 172.23.64.188:6030
        - name: FALCON_TRANSFER_URL
          value: 172.23.64.188:8433
        - name: MYSQL_ROOT_PASSWORD
          value: root
        - name: MYSQL_DATABASE
          value: paas
        - name: MYSQL_USER
          value: paas
        - name: MYSQL_PASSWORD
          value: paas
        - name: MYSQL_SERVER_ID
          value: "1"
        - name: MYSQL_TYPE
          value: Primary
        imagePullPolicy: Always
      restartPolicy: Always
```
    PS说明：
    spec |_ volumes |_  rbd |_ `monitors`: ceph 服务端地址和端口
    FALCON_HOSTNAME:open-falcon中显示的节点名 
    FALCON_HEARTBEAT_URL:open-falcon heartbeat url 
    FALCON_TRANSFER_URL:open-falcon transfer url 
    MYSQL_ROOT_PASSWORD:MySQL root账号密码 
    MYSQL_DATABASE:初始化时创建的数据库名（可选） 
    MYSQL_USER:初始化时创建的数据库账号（可选） 
    MYSQL_PASSWORD:初始化时创建的数据库账号密码（可选） 
    MYSQL_SERVER_ID:默认1 
    MYSQL_TYPE:默认Primary
- k8s 创建Service
> 创建mysql对应的k8s服务；参见：https://git.newtouch.com/newtouch-one/nbo-deploy-resource/blob/master/k8s/mysql/mysql-service.yaml
```
apiVersion: v1
kind: Service
metadata:
  name: paas-mysql
  namespace: newtouchone
  labels:
    instanceId: paas-mysql
    paas: paas
  annotations:
    kubernetesReverseproxy : '{"hosts":[{"nodePort":31796,"tcp":true}]}'
spec:
  selector:
    instanceId: paas-mysql
  type: NodePort
  ports:
  - port: 3306
    nodePort: 31796
```
## 部署Redis

> 使用下列命令创建mysql镜像
    > `ssh ceph1`进入ceph服务器，
    > `docker ps`查看paas-system-wrapper容器ID（可通过`COMMAND `命令确认，值为`java -jar paas-syste`）
```
rbd create redispaas --size 2048 --pool paas
```
    PS说明：
    `redispaas `为镜像名称
    `2048` 为存储大小
    `paas`为准备工作中的连接池名

- 创建Redis的Replication Controllers
>Replication Controllers Yaml文件；参见：https://git.newtouch.com/newtouch-one/nbo-deploy-resource/blob/master/k8s/redis/redis-rc.yaml
```
apiVersion: v1
kind: ReplicationController
metadata:
  name: paas-redis
  namespace: newtouchone
  labels:
    instanceId: paas-redis
    instanceEngineType: Redis
    paas: paas
spec:
  replicas: 1
  selector:
    instanceId: paas-redis
  template:
    metadata:
      name: paas-redis
      namespace: newtouchone
      labels:
        instanceId: paas-redis
        instanceEngineType: Redis
        paas: paas
    spec:
      volumes:
      - name: rbd-vol
        rbd:
          monitors:
          - 172.21.5.104:6789
          pool: paas
          image: redispaas
          user: admin
          secretRef:
            name: ceph-secret-newtouch-one
          fsType: ext4
          readOnly: false
      containers:
      - name: paas-redis
        image: 172.21.3.106:5000/newtouchone/nt-redis:3.2.4
        resources:
          limits:
            memory: 1024M
            cpu: '1'
        ports:
        - containerPort: 6379
        volumeMounts:
        - name: rbd-vol
          mountPath: "/data"
        env:
        - name: FALCON_HOSTNAME
          value: newtouch-paas-redis
        - name: FALCON_HEARTBEAT_URL
          value: 172.23.64.188:6030
        - name: FALCON_TRANSFER_URL
          value: 172.23.64.188:8433
        - name: REDIS_AUTH_PASSWORD
          value: root
        imagePullPolicy: Always
      restartPolicy: Always
```
    参数说明：
    FALCON_HOSTNAME:open-falcon中显示的节点名 
    FALCON_HEARTBEAT_URL:open-falcon heartbeat url 
    FALCON_TRANSFER_URL:open-falcon transfer url 
    REDIS_AUTH_PASSWORD: Redis认证密码 
- 创建Redis的Service
> 一下为创建Service的Yaml文件代码；参见https://git.newtouch.com/newtouch-one/nbo-deploy-resource/blob/master/k8s/redis/redis-service.yaml
```
apiVersion: v1
kind: Service
metadata:
  name: paas-redis
  namespace: newtouchone
  labels:
    instanceId: paas-redis
    paas: paas
  annotations:
    kubernetesReverseproxy : |
      '{"hosts":[{"paas-redis.newtouchone","nodePort":32322,"tcp":true}]}'
spec:
  selector:
    instanceId: paas-redis
  type: NodePort
  ports:
  - port: 6379
    nodePort: 32322
```
配置文件范例见附件
安装配置
kubectl create -f one-namespace.yaml 
kubectl create -f one-zk-deployment.yaml 
kubectl create -f one-zk-service.yaml 
kubectl create -f cephsecret.yaml 
kubectl create -f mysql-configmap.yaml 
kubectl create -f mysql-rc.yaml 
kubectl create -f mysql-service.yaml 
kubectl create -f redis-rc.yaml 
kubectl create -f redis-service.yaml 
kubectl create -f rabbitmq-deployment.yaml 
kubectl create -f rabbitmq-service.yaml 
kubectl create -f sonarqube-deployment.yaml 
kubectl create -f sonarqube-service.yaml 
删除配置
kubectl delete -f sonarqube-service.yaml 
kubectl delete -f sonarqube-deployment.yaml 
kubectl delete -f rabbitmq-service.yaml 
kubectl delete -f rabbitmq-deployment.yaml 
kubectl delete -f redis-service.yaml 
kubectl delete -f redis-rc.yaml 
kubectl delete -f mysql-service.yaml 
kubectl delete -f mysql-rc.yaml 
kubectl delete -f mysql-configmap.yaml 
kubectl delete -f cephsecret.yaml 
kubectl delete -f one-zk-service.yaml 
kubectl delete -f one-zk-deployment.yaml 
kubectl delete -f one-namespace.yaml 


[root@proxy kube-setup]# kubectl  get daemonsets -n newtouchone
NAME        DESIRED   CURRENT   READY     UP-TO-DATE   AVAILABLE   NODE-SELECTOR   AGE
one-proxy   1         1         1         1            1           PROXY=TRUE      36s
