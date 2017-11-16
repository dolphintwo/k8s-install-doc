docker run -d \
-p 9999:9000 \
--name minio \
-v /mnt/minio/data:/data \
-v /mnt/minio/config:/root/.minio  \
-e "MINIO_ACCESS_KEY=admin"  \
-e "MINIO_SECRET_KEY=Accp1234"  \
172.21.1.35:5000/newtouchone/serviceimage-minio:latest server /data
