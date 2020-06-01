#### Install Nextcloud on Ubuntu 19.10 ####
(Das zu installierende Ubuntu 19.10 wird bei der Vorinstallation maximal mit SSH ausgestattet. LAMP vorher zu installieren führt zu Problemen da ein Mariadb Passwort verlangt wird.)
### updating
`apt update && upgrade`

### install apache
* `apt install apache2`
* `systemctl start apache2.service`

### install Marai DB
* `apt install mariadb-server mariadb-client`

#### Maria DB Server Konfiguration
* `mysql_secure_installation`
````
Enter current password for root (enter for none): Just press the Enter
Set root password? [Y/n]: Y
New password: Enter password
Re-enter new password: Repeat password
Remove anonymous users? [Y/n]: Y
Disallow root login remotely? [Y/n]: Y
Remove test database and access to it? [Y/n]:  Y
Reload privilege tables now? [Y/n]:  Y
````
* restart Maria DB server
  * `systemctl restart mariadb.service`

### Install PHP & Modules

1.  add PHP repository
  * `apt install software-properties-common`
  * `add-apt-repository ppa:ondrej/php`
  * `apt-get update`


2. final PHP installation & modules

  	* `apt install php7.3 libapache2-mod-php7.3 php7.3-common php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-mysql php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-imagick`

3. adjust PHP.ini file
  * `nano /etc/php/7.3/apache2/php.ini`

Strg+W zum suchen

* RAM
  * memory_limit = 2048M


* Maximale Upload File Größe
    * upload_max_filesize = 800G
    * post_max_size = 800G


* timezone
  * date.timezone = Europe/Berlin


* keine Ahnung wofür...

  * file_uploads = On

  * allow_url_fopen = On

  * display_errors = Off



### Create nextcloud Database

1. open SQL dialoge
  * `mysql`

    habe stattedessen
  * `mysql -u root -p`

    genutzt
2. Create database namens nextcloud
 * `CREATE DATABASE nextcloud;`

3. Create database user with password

  * `CREATE USER 'nc_user'@'localhost' IDENTIFIED BY 'Your-PW-here';`

4. Grant accesss to databse
 * `GRANT ALL ON nextcloud.* TO 'nc_user'@'localhost' IDENTIFIED BY 'hallowelt' WITH GRANT OPTION;`

5. save changes and exit
  * `FLUSH PRIVILEGES;`
  * `EXIT;`

### Download lastest nextcloud version
(Es ist dabei auf die neuste Version von NC zu achten.)
* `cd /var/www`
* `wget https://download.nextcloud.com/server/releases/nextcloud-18.0.0.tar.bz2 -O nextcloud-18-latest.tar.bz2`
* `tar -xvjf nextcloud-18-latest.tar.bz2`
* `chown -R www-data:www-data nextcloud`
* `rm nextcloud-18-latest.tar.bz2`
* ``
### configure Apache2

Beipieldatei:

````
Alias /nextcloud "/var/www/nextcloud/"

<Directory /var/www/nextcloud/>
  Options +FollowSymlinks
  AllowOverride All

 <IfModule mod_dav.c>
  Dav off
 </IfModule>

 SetEnv HOME /var/www/nextcloud
 SetEnv HTTP_HOME /var/www/nextcloud

</Directory>
````



### Enable the NextCloud and Rewrite Module

* `a2ensite nextcloud`
* `a2enmod rewrite headers env dir mime`
* `systemctl restart apache2.service`
