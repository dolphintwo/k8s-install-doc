wget https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz

tar zxvf prometheus-2.0.0.linux-amd64.tar.gz
cd prometheus-2.0.0.linux-amd64/
cp prometheus.yml prometheus.yml_bak
./prometheus

scp ~/.ssh/id_rsa.pub root@myjdc:/tmp


cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
hostnamectl set-hostname hbjdc4d
passwd
yum install -y docker git gcc gcc-c++ ncurses-devel zlib zlib-devel openssl openssl--devel pcre pcre-devel vim lrzsz unzip
git config --global user.name "dolphintwo"
git config --global user.email "dtdinghui@126.com"
git config --list
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
nvm install 8.9.2

vim /etc/docker/daemon.json
"registry-mirrors": ["https://omrhxrz9.mirror.aliyuncs.com"]
systemctl enable docker
systemctl start docker
systemctl restart docker
docker pull mysql
docker tag docker.io/mysql:latest dolphintwo/mysql:5.7.20
docker rmi docker.io/mysql
mkdir -p /mnt/data/mysql
docker run -d --name dd_mysql -v /mnt/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD='&UJM8ik,' --restart always -p 3306:3306 dolphintwo/mysql:5.7.20
cd /usr/local/src/
wget http://nginx.org/download/nginx-1.12.2.tar.gz
tar -zxvf nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure
make && make install

systemctl start firewalld
firewall-cmd --add-port=3306/tcp --zone=public --permanent
firewall-cmd --add-port=80/tcp --zone=public --permanent
firewall-cmd --add-port=9000/tcp --zone=public --permanent
firewall-cmd --add-port=443/tcp --zone=public --permanent
firewall-cmd --reload
firewall-cmd --list-ports



cd /usr/local/src/
wget http://updatenew.dedecms.com/base-v57/package/DedeCMS-V5.7-UTF8-SP2-Full.tar.gz
wget http://cn.php.net/distributions/php-5.6.32.tar.gz
tar zxvf php-5.6.32.tar.gz
cd php-5.6.32
./configure --prefix=/usr/local/php --enable-fpm 



wget centos.bz/ezhttp.zip
unzip ezhttp.zip
cd ezhttp-master
./start.sh