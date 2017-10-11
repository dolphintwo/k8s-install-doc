# k8s添加节点

k8s添加节点按照以下顺序进行
etcd -> flannel -> docker -> kubectl/kubelet -> kube-proxy -> registry证书
## etcd
节点etcd只做校验使用

mkdir -p /var/lib/etcd
cp etcd-v3.1.6-linux-amd64/etcd* /usr/bin

## flannel
flanneld.service
```
[Unit]
Description=Flanneld overlay address etcd agent
After=network.target
After=network-online.target
Wants=network-online.target
After=etcd.service
Before=docker.service

[Service]
Type=notify
ExecStart=/usr/bin/flanneld \
  -etcd-endpoints=http://172.21.7.11:2379 \
  -etcd-prefix=/kubernetes/network
ExecStartPost=/usr/bin/mk-docker-opts.sh -k DOCKER_NETWORK_OPTIONS -d /run/flannel/docker
Restart=on-failure

[Install]
WantedBy=multi-user.target
RequiredBy=docker.service
```
```
cp flannel/{flanneld,mk-docker-opts.sh} /usr/bin
cp flanneld.service /usr/lib/systemd/system/
```
```
systemctl daemon-reload
systemctl enable flanneld
systemctl start flanneld
systemctl status flanneld
```
检查
```
systemctl restart flanneld
journalctl  -u flanneld |grep 'Lease acquired'
ifconfig flannel.1
/usr/bin/etcdctl --endpoints=http://172.21.7.11:2379 get /kubernetes/network/config
/usr/bin/etcdctl --endpoints=http://172.21.7.11:2379 ls /kubernetes/network/subnets
/usr/bin/etcdctl --endpoints=http://172.21.7.11:2379 get /kubernetes/network/subnets/172.30.2.0-24
```


## docker 
cp docker/docker* /usr/bin

/usr/lib/systemd/system/docker.service
```
[Unit]
Description=Docker Application Container Engine
Documentation=http://docs.docker.io

[Service]
Environment="PATH=/root/local/bin:/bin:/sbin:/usr/bin:/usr/sbin"
EnvironmentFile=-/run/flannel/docker
ExecStart=/usr/bin/dockerd --log-level=error $DOCKER_NETWORK_OPTIONS
ExecReload=/bin/kill -s HUP $MAINPID
Restart=on-failure
RestartSec=5
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
Delegate=yes
KillMode=process

[Install]
WantedBy=multi-user.target
```

mkdir -p /mnt/docker
mkdir -p /etc/docker
/etc/docker/daemon.json
```
{
  "storage-driver": "overlay",
  "graph": "/mnt/docker",
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"],
  "insecure-registries":["183.66.65.205:5000","218.245.66.213:5000","registry.one2.newtouch.com:5000"]
}
```


systemctl daemon-reload
systemctl enable docker
systemctl start docker


检查
docker version
docker info

## kubectl/kubelet 
cp -r kubernetes/server/bin/{kube-proxy,kubelet,kubectl} /usr/bin/
mkdir /root/.kube
scp node3:/root/.kube/config /root/.kube/config

配置kubelet
kubectl config set-cluster kubernetes --certificate-authority=/etc/kubernetes/ssl/ca.pem --embed-certs=true --server=https://172.21.7.11:6443 --kubeconfig=bootstrap.kubeconfig
kubectl config set-credentials kubelet-bootstrap --token=41f7e4ba8b7be874fcff18bf5cf41a7c --kubeconfig=bootstrap.kubeconfig
kubectl config set-context default --cluster=kubernetes --user=kubelet-bootstrap --kubeconfig=bootstrap.kubeconfig
kubectl config use-context default --kubeconfig=bootstrap.kubeconfig
mv bootstrap.kubeconfig /etc/kubernetes/

mkdir /var/lib/kubelet
/usr/lib/systemd/system/kubelet.service
// cp kubelet.service /usr/lib/systemd/system/kubelet.service
```
[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=docker.service
Requires=docker.service

[Service]
WorkingDirectory=/var/lib/kubelet
ExecStart=/usr/bin/kubelet \
  --address=172.21.7.15 \
  --hostname-override=172.21.7.15 \
  --pod-infra-container-image=172.21.7.11:5000/newtouchone/pod-infrastructure:latest \
  --experimental-bootstrap-kubeconfig=/etc/kubernetes/bootstrap.kubeconfig \
  --kubeconfig=/etc/kubernetes/kubelet.kubeconfig \
  --require-kubeconfig \
  --cert-dir=/etc/kubernetes/ssl \
  --cluster_dns=10.254.0.2 \
  --cluster_domain=cluster.local. \
  --hairpin-mode promiscuous-bridge \
  --allow-privileged=true \
  --serialize-image-pulls=false \
  --logtostderr=true \
  --v=2
ExecStopPost=/sbin/iptables -A INPUT -s 10.0.0.0/8 -p tcp --dport 4194 -j ACCEPT
ExecStopPost=/sbin/iptables -A INPUT -s 172.16.0.0/12 -p tcp --dport 4194 -j ACCEPT
ExecStopPost=/sbin/iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 4194 -j ACCEPT
ExecStopPost=/sbin/iptables -A INPUT -p tcp --dport 4194 -j DROP
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```

systemctl daemon-reload
systemctl enable kubelet
systemctl start kubelet
systemctl status kubelet

kubectl get csr
kubectl certificate approve csr-2b308
kubectl get nodes


## kube-proxy

配置kube-proxy
kubectl config set-cluster kubernetes --certificate-authority=/etc/kubernetes/ssl/ca.pem --embed-certs=true --server=https://172.21.7.11:6443 --kubeconfig=kube-proxy.kubeconfig
kubectl config set-credentials kube-proxy --client-certificate=/etc/kubernetes/ssl/kube-proxy.pem --client-key=/etc/kubernetes/ssl/kube-proxy-key.pem --embed-certs=true --kubeconfig=kube-proxy.kubeconfig
kubectl config set-context default --cluster=kubernetes --user=kube-proxy --kubeconfig=kube-proxy.kubeconfig
kubectl config use-context default --kubeconfig=kube-proxy.kubeconfig
mv kube-proxy.kubeconfig /etc/kubernetes/


mkdir -p /var/lib/kube-proxy

cp kube-proxy.service /usr/lib/systemd/system/

systemctl daemon-reload
systemctl enable kube-proxy
systemctl start kube-proxy
systemctl status kube-proxy

## 节点打标签

kubectl label nodes 172.21.7.15 FUN=DOCKER
kubectl label nodes 172.21.7.15 BUILD=TRUE
kubectl label nodes 172.21.7.15 SERVICE=TRUE


## registry证书
mkdir -p /etc/docker/certs.d/172.21.7.11:5000  
cp /etc/kubernetes/ssl/ca.pem /etc/docker/certs.d/172.21.7.11:5000/ca.crt

