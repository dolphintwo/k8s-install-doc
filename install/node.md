rm -rf /root/.kube/*
rm -rf /etc/kubernetes
rm -rf /var/lib/kube*
mkdir -p /var/lib/kubelet
mkdir -p /var/lib/kube-proxy
systemctl disable kubelet
systemctl stop kubelet
systemctl disable kube-proxy
systemctl stop kube-proxy
rm -f /usr/lib/systemd/system/kubelet.service
rm -f /usr/lib/systemd/system/kube-proxy.service
systemctl daemon-reload

scp 172.21.4.6:/root/.kube/config /root/.kube/config
scp 172.21.4.6:/etc/kubernetes.tar.gz /etc/
cd /etc
tar xvf kubernetes.tar.gz

cd /root/install
cp kubelet.service /usr/lib/systemd/system/kubelet.service
systemctl daemon-reload
systemctl enable kubelet
systemctl start kubelet
systemctl status kubelet
kubectl get csr
kubectl certificate approve

kubectl get nodes

vim kube-proxy.service
:%s/\\\\/\\/g
cp kube-proxy.service /usr/lib/systemd/system/kube-proxy.service
systemctl daemon-reload
systemctl enable kube-proxy
systemctl start kube-proxy
systemctl status kube-proxy















