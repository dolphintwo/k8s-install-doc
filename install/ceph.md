# 清理

docker rm -f ceph-mon
docker rm -f ceph-osd
docker rm -f ceph-mds
docker rm -f ceph-rgw
docker rm -f ceph-wrapper
rm -rf /etc/ceph/*
rm -rf /var/lib/ceph/*
rm -rf /ceph/*


# 安装
## mon
docker run -d \
--net=host \
--name=ceph-mon \
--restart always \
-v /etc/ceph:/etc/ceph \
-v /var/lib/ceph/:/var/lib/ceph/ \
-e MON_IP=172.21.4.11 \
-e CEPH_PUBLIC_NETWORK=172.21.4.1/16 \
172.21.1.35:5000/newtouchone/ceph-daemon mon

echo "
osd pool default size = 1
osd pool default min size = 1
osd crush chooseleaf type = 0
" >> /etc/ceph/ceph.conf

docker restart ceph-mon

## mds
docker run -d \
--net=host \
--name=ceph-mds \
--restart always \
-v /etc/ceph:/etc/ceph \
-v /var/lib/ceph/:/var/lib/ceph/ \
-e CEPHFS_CREATE=1 \
172.21.1.35:5000/newtouchone/ceph-daemon mds

## osd
docker run -d \
--net=host \
--name=ceph-osd \
--restart always \
--privileged=true \
-v /etc/ceph:/etc/ceph \
-v /var/lib/ceph/:/var/lib/ceph/ \
-v /dev/:/dev/ \
-v /ceph:/var/lib/ceph/osd \
172.21.1.35:5000/newtouchone/ceph-daemon osd_directory

## rgw
docker run -d \
--net=host \
--name=ceph-rgw \
--restart always \
-v /etc/ceph:/etc/ceph \
-v /var/lib/ceph/:/var/lib/ceph/ \
-e RGW_CIVETWEB_PORT=7480 \
172.21.1.35:5000/newtouchone/ceph-daemon rgw

## paas-ceph-wrapper
docker run -d \
-p 9080:8080 \
--name=ceph-wrapper \
--restart always \
-v /etc/ceph:/etc/ceph \
172.21.1.35:5000/newtouchone/paas-ceph-wrapper:20161013

## 健康检查
docker exec -ti ceph-wrapper ceph status
### 修改告警
```
#查询pool列表
docker exec -ti ceph-wrapper ceph osd lspools
#结果显示如下
0 rbd,1 cephfs_data,2 cephfs_metadata,
#修改列表中的pool的size为1
docker exec -ti ceph-wrapper ceph osd pool set rbd size 1
docker exec -ti ceph-wrapper ceph osd pool set cephfs_data size 1
docker exec -ti ceph-wrapper ceph osd pool set cephfs_metadata size 1
```

## 网关用户
```
# 创建网关用户
docker exec -ti ceph-rgw radosgw-admin user create --uid="admin" --display-name="admin"
# 给网关用户授权
docker exec -ti ceph-rgw radosgw-admin  caps add --uid=admin --caps="users=*;buckets=*;metadata=*;usage=*;zone=*"
```

## ceph-common安装
```
cd /root/install
tar -zxvf ceph.tar.gz
cd ceph
chmod +x install_ceph.sh
./install_ceph.sh

```

172.21.4.11:6789