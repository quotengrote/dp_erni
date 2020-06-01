#### Install Nextcloud on Ubuntu 19.04 ####

# updating
apt-get update
apt-get upgrade

# install apache
apt install apache2

# directory listing deaktivieren
sed -i "s/Options Indexes FollowSymLinks/Options FollowSymLinks/" /etc/apache2/apache2.conf

# start apache service
systemctl start apache2.service

# install Marai DB
apt install mariadb-server mariadb-client

# Maria DB Server Konfiguration
mysql_secure_installation

Enter current password for root (enter for none): Just press the Enter
Set root password? [Y/n]: Y
New password: Enter password
Re-enter new password: Repeat password
Remove anonymous users? [Y/n]: Y
Disallow root login remotely? [Y/n]: Y
Remove test database and access to it? [Y/n]:  Y
Reload privilege tables now? [Y/n]:  Y

# restart Maria DB server
systemctl restart mariadb.service

## Install PHP & Modules
installing PHP 7.3

# add PHP repository
apt-get install software-properties-common
add-apt-repository ppa:ondrej/php

apt-get update


# final PHP installation & modules
apt install php7.3 libapache2-mod-php7.3 php7.3-common php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-mysql php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-imagick

# adjust PHP.ini file
nano /etc/php/7.3/apache2/php.ini

file_uploads = On
allow_url_fopen = On
memory_limit = 1024M
upload_max_filesize = 16G
post_max_size = 16G
display_errors = Off
date.timezone = Europe/Berlin


## create nextcloud Database

# open SQL dialoge
mysql

# create database calles nextcloud
CREATE DATABASE nextcloud;

# create database user with password
CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'password_here';

#grant accesss to databse
GRANT ALL ON nextcloud.* TO 'nextclouduser'@'localhost' IDENTIFIED BY 'password_here' WITH GRANT OPTION;

#save changes and exit
FLUSH PRIVILEGES;
EXIT;

## Download lastest nextcloud version
cd /tmp && wget
apt-get install unzip
unzip nextcloud
mv nextcloud /var/www/

## configure Apache2

#create new conf
nano /etc/apache2/sites-available/nextcloud.conf

# Enable the NextCloud and Rewrite Module

a2ensite nextcloud.conf
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime

# restart apache
systemctl restart apache2.service

# prepare data folder
cd /home
mkdir /home/data/
chown -R www-data:www-data /home/data/

chown -R www-data:www-data /var/www/nextcloud/
chmod -R 755 /var/www/nextcloud/

--> Domain ansurfen und Einrichtung abschließen

## create Let's Encrypt SSL-Certificate

#install certbot
apt-get install python-certbot-apache

certbot --apache -m master@domain.com -d cloud.domain.com
