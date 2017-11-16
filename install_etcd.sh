#!/bin/bash

#脚本启动方式：(本脚步只支持http——etcd集群)
#例子：./install_etcd.sh NODE_NAME="host0" ETCD_NODES="host0=http://0.0.0.0:2380,host1=http://0.0.0.0:2380,host2=http://0.0.0.0:2380"
# etcd集群通信（默认端口2380）
tar -xvf etcd-v3.1.6-linux-amd64.tar.gz && cd etcd-v3.1.6-linux-amd64 && ls -rlh | grep etcd
rm -rf /usr/bin/etcd* && cp etcd* /usr/bin/

#NODE_NAME=etcd-host0
NODE_NAME="${NODE_NAME}" # 当前部署的机器名称(随便定义，只要能区分不同机器即可)

NODE_IP=`ip addr show | grep inet | grep -v inet6 | grep brd | awk '{print $2}' | cut -f1 -d '/'` # 当前部署的机器 IP
# etcd 集群间通信的IP和端口

# ETCD_NODES=etcd-host0=http://10.186.122.61:2380,etcd-host1=http://10.186.122.64:2380,etcd-host2=http://10.186.122.67:2380
ETCD_NODES="${ETCD_NODES}"

rm -rf /usr/bin/etcd* && cp etcd* /usr/bin/

# STEP 3 创建 etcd 的 systemd unit 文件


mkdir -p /var/lib/etcd  # 必须先创建工作目录

echo "[Unit]
Description=Etcd Server

[Service]
Type=notify
WorkingDirectory=/var/lib/etcd/
ExecStart=/usr/bin/etcd \
  --name=${NODE_NAME} \
  --initial-advertise-peer-urls=http://${NODE_IP}:2380 \
  --listen-peer-urls=http://0.0.0.0:2380 \
  --listen-client-urls=http://0.0.0.0:2379 \
  --advertise-client-urls=http://${NODE_IP}:2379 \
  --initial-cluster=${ETCD_NODES} \
  --initial-cluster-token=etcd-cluster-1 \
  --initial-cluster-state=new \
  --data-dir=/var/lib/etcd

Restart=always
RestartSec=5
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target " > /usr/lib/systemd/system/etcd.service

systemctl stop etcd
systemctl daemon-reload
systemctl enable etcd
systemctl start etcd
systemctl status etcd

