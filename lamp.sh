#!bin/bash

echo 'update package'

yum update -y

echo 'install Apache'

yum install httpd -y

echo 'start apache'

systemctl start httpd.service

echo 'start apache on starup'

systemctl enable httpd.service

echo 'install mysql (MariaDB)'

yum install mariadb-server -y

echo 'start mysql'

systemctl start mariadb.service

echo 'start mariadb on starup'

systemctl enable mariadb.service

echo 'install php'

echo 'install the Remi'

yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y

yum install yum-utils -y

yum-config-manager --enable remi-php80

yum install php php-fpm php-common php-opcache php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-redis php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml -y

echo 'restart apache'

systemctl restart httpd.service

echo 'Finally Checking status of services'

echo Apache service is $(systemctl is-active httpd)

echo Maria DB service is $(systemctl is-active mariadb)

echo $(php -v)

echo 'LAMP setup installed Successfully'
