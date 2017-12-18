wget https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz

tar zxvf prometheus-2.0.0.linux-amd64.tar.gz
cd prometheus-2.0.0.linux-amd64/
cp prometheus.yml prometheus.yml_bak
./prometheus

cat ~/.ssh/id_rsa.pub | ssh root@116.196.101.123 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
cat ~/.ssh/id_rsa.pub | ssh root@60.205.231.165 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
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

## 防火墙设置
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --add-port=3306/tcp --zone=public --permanent
firewall-cmd --add-port=80/tcp --zone=public --permanent
firewall-cmd --add-port=32222/tcp --zone=public --permanent
firewall-cmd --add-port=443/tcp --zone=public --permanent
firewall-cmd --reload
firewall-cmd --list-ports

wget http://updatenew.dedecms.com/base-v57/package/DedeCMS-V5.7-UTF8-SP2-Full.tar.gz
## 安装php5.6
yum -y install gcc automake autoconf libtool make gcc-c++ glibc

yum -y install libmcrypt-devel mhash-devel libxslt-devel \
libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel \
zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel \
ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel \
krb5 krb5-devel libidn libidn-devel openssl openssl-devel

cd /usr/local/src/

wget http://cn.php.net/distributions/php-5.6.32.tar.gz
tar zxvf php-5.6.32.tar.gz
cd php-5.6.32
./configure --enable-fpm --with-mcrypt \
--enable-mbstring --disable-pdo --with-curl --disable-debug  --disable-rpath \
--enable-inline-optimization --with-bz2  --with-zlib --enable-sockets \
--enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex \
--with-mhash --enable-zip --with-pcre-regex --with-mysql --with-mysqli \
--with-gd --with-jpeg-dir --with-openssl

make && make install
Installing PHP CLI binary:        /usr/local/bin/
Installing PHP CLI man page:      /usr/local/php/man/man1/
Installing PHP FPM binary:        /usr/local/sbin/
Installing PHP FPM config:        /usr/local/etc/
Installing PHP FPM man page:      /usr/local/php/man/man8/
Installing PHP FPM status page:   /usr/local/php/php/fpm/
Installing PHP CGI binary:        /usr/local/bin/
Installing PHP CGI man page:      /usr/local/php/man/man1/
Installing build environment:     /usr/local/lib/php/build/
Installing header files:           /usr/local/include/php/
Installing helper programs:       /usr/local/bin/

You may want to add: /usr/local/lib/php to your php.ini include_path
/usr/local/src/php-5.6.32/build/shtool install -c ext/phar/phar.phar /usr/local/bin
ln -s -f phar.phar /usr/local/bin/phar

cd /usr/local/etc
cp php-fpm.conf.default php-fpm.conf
vim php-fpm.conf
www-data

groupadd www-data
useradd -g www-data www-data


## 安装nginx
cd /usr/local/src/
wget http://nginx.org/download/nginx-1.12.2.tar.gz
tar -zxvf nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure --with-http_ssl_module --with-pcre
make && make install

```
# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
#   
location ~ \.php$ {
    root           html;
    fastcgi_pass   127.0.0.1:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    include        fastcgi_params;
}
```

## 安装mysql

cmake \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DMYSQL_TCP_PORT=3306 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_SSL=yes