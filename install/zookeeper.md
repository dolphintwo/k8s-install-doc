# zookeeper

wget http://newdocker.oss-cn-shanghai.aliyuncs.com/newtouchone/oneservice/zk/one-zk-deployment.yaml
wget http://newdocker.oss-cn-shanghai.aliyuncs.com/newtouchone/oneservice/zk/one-zk-service.yaml

kubectl create -f one-zk-deployment.yaml
kubectl get pods -n newtouchone

kubectl create -f one-zk-service.yaml
kubectl get services -n newtouchone