#!/bin/bash



#################################################### CONFIGURATION ###
BUILD=202112181
PASS=???
DBPASS=???
SERVERID=???
REPO=nastenshow/web100now


####################################################   CLI TOOLS   ###
reset=$(tput sgr0)
bold=$(tput bold)
underline=$(tput smul)
black=$(tput setaf 0)
white=$(tput setaf 7)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
bgblack=$(tput setab 0)
bgwhite=$(tput setab 7)
bgred=$(tput setab 1)
bggreen=$(tput setab 2)
bgyellow=$(tput setab 4)
bgblue=$(tput setab 4)
bgpurple=$(tput setab 5)



#################################################### Web100Now SETUP ######



# 1) LOGO
clear
echo "${green}${bold}"
echo ""
echo "░██╗░░░░░░░██╗███████╗██████╗░░░███╗░░░█████╗░░█████╗░███╗░░██╗░█████╗░░██╗░░░░░░░██╗" 
echo "░██║░░██╗░░██║██╔════╝██╔══██╗░████║░░██╔══██╗██╔══██╗████╗░██║██╔══██╗░██║░░██╗░░██║" 
echo "░╚██╗████╗██╔╝█████╗░░██████╦╝██╔██║░░██║░░██║██║░░██║██╔██╗██║██║░░██║░╚██╗████╗██╔╝" 
echo "░░████╔═████║░██╔══╝░░██╔══██╗╚═╝██║░░██║░░██║██║░░██║██║╚████║██║░░██║░░████╔═████║░" 
echo "░░╚██╔╝░╚██╔╝░███████╗██████╦╝███████╗╚█████╔╝╚█████╔╝██║░╚███║╚█████╔╝░░╚██╔╝░╚██╔╝░" 
echo "░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░░"
echo ""
echo "The installation has started... Wait!"
echo "${reset}"
sleep 3s


# 2) System check...
clear
clear
echo "${bggreen}${black}${bold}"
echo "2) System check..."
echo "${reset}"
sleep 1s

ID=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
VERSION=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
if [ "$ID" = "ubuntu" ]; then
    case $VERSION in
        20.04)
            break
            ;;
        *)
            echo "${bgred}${white}${bold}"
            echo "Web100Now only supports Linux Ubuntu 20.04 LTS"
            echo "${reset}"
            exit 1;
            break
            ;;
    esac
else
    echo "${bgred}${white}${bold}"
    echo "Web100Now only supports Linux Ubuntu 20.04 LTS"
    echo "${reset}"
    exit 1
fi



# 3) Checking permission
clear
clear
echo "${bggreen}${black}${bold}"
echo "3) Checking permission..."
echo "${reset}"
sleep 1s

if [ "$(id -u)" = "0" ]; then
    clear
else
    clear
    echo "${bgred}${white}${bold}"
    echo "You must run Web100Now as root. (In AWS, use "sudo -s")"
    echo "${reset}"
    exit 1
fi



# 4) BASIC SETUP
clear
clear
echo "${bggreen}${black}${bold}"
echo "4) Base setup..."
echo "${reset}"
sleep 1s

sudo apt-get update
sudo apt-get -y install software-properties-common curl wget nano vim rpl sed zip unzip openssl expect dirmngr apt-transport-https lsb-release ca-certificates dnsutils dos2unix zsh htop ffmpeg


# 5) Getting IP
clear
clear
echo "${bggreen}${black}${bold}"
echo "5) Getting IP..."
echo "${reset}"
sleep 1s

IP=$(curl -s https://checkip.amazonaws.com)


# 6) Creation of environments settings
clear
echo "${bggreen}${black}${bold}"
echo "6 )Creation of environments settings..."
echo "${reset}"
sleep 1s

WELCOME=/etc/motd
sudo touch $WELCOME
sudo cat > "$WELCOME" <<EOF

░██╗░░░░░░░██╗███████╗██████╗░░░███╗░░░█████╗░░█████╗░███╗░░██╗░█████╗░░██╗░░░░░░░██╗
░██║░░██╗░░██║██╔════╝██╔══██╗░████║░░██╔══██╗██╔══██╗████╗░██║██╔══██╗░██║░░██╗░░██║
░╚██╗████╗██╔╝█████╗░░██████╦╝██╔██║░░██║░░██║██║░░██║██╔██╗██║██║░░██║░╚██╗████╗██╔╝
░░████╔═████║░██╔══╝░░██╔══██╗╚═╝██║░░██║░░██║██║░░██║██║╚████║██║░░██║░░████╔═████║░
░░╚██╔╝░╚██╔╝░███████╗██████╦╝███████╗╚█████╔╝╚█████╔╝██║░╚███║╚█████╔╝░░╚██╔╝░╚██╔╝░
░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░░

EOF



# 7) MEMORY EXCHANGE
clear
echo "${bggreen}${black}${bold}"
echo "7) MEMORY EXCHANGE..."
echo "${reset}"
sleep 1s

sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1



# 8) ALIAS
clear
echo "${bggreen}${black}${bold}"
echo "Custom CLI configuration..."
echo "${reset}"
sleep 1s

shopt -s expand_aliases
alias ll='ls -alF'



# 9) Web100Now DIRS
clear
echo "${bggreen}${black}${bold}"
echo "Web100Now directories..."
echo "${reset}"
sleep 1s

sudo mkdir /etc/web100now/
sudo chmod o-r /etc/web100now
sudo mkdir /var/web100now/
sudo chmod o-r /var/web100now



# 10) USER
clear
echo "${bggreen}${black}${bold}"
echo "Web100Now root user..."
echo "${reset}"
sleep 1s

sudo pam-auth-update --package
sudo mount -o remount,rw /
sudo chmod 640 /etc/shadow
sudo useradd -m -s /bin/bash web100now
echo "web100now:$PASS"|sudo chpasswd
sudo usermod -aG sudo web100now


# 11) NGINX
clear
echo "${bggreen}${black}${bold}"
echo "nginx setup..."
echo "${reset}"
sleep 1s

sudo apt-get -y install nginx-core
sudo systemctl start nginx.service
sudo rpl -i -w "http {" "http { limit_req_zone \$binary_remote_addr zone=one:10m rate=1r/s; fastcgi_read_timeout 300;" /etc/nginx/nginx.conf
sudo rpl -i -w "http {" "http { limit_req_zone \$binary_remote_addr zone=one:10m rate=1r/s; fastcgi_read_timeout 300;" /etc/nginx/nginx.conf
sudo systemctl enable nginx.service





# 12) FIREWALL
clear
echo "${bggreen}${black}${bold}"
echo "12) fail2ban setup..."
echo "${reset}"
sleep 1s

sudo apt-get -y install fail2ban
JAIL=/etc/fail2ban/jail.local
sudo unlink JAIL
sudo touch $JAIL
sudo cat > "$JAIL" <<EOF
[DEFAULT]
bantime = 3600
banaction = iptables-multiport
[sshd]
enabled = true
logpath  = /var/log/auth.log
EOF
sudo systemctl restart fail2ban
sudo ufw --force enable
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow "Nginx Full"




# 13) PHP
clear
echo "${bggreen}${black}${bold}"
echo "13) PHP setup..."
echo "${reset}"
sleep 1s


sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt-get -y install php7.4-fpm
sudo apt-get -y install php7.4-common
sudo apt-get -y install php7.4-curl
sudo apt-get -y install php7.4-openssl
sudo apt-get -y install php7.4-bcmath
sudo apt-get -y install php7.4-mbstring
sudo apt-get -y install php7.4-tokenizer
sudo apt-get -y install php7.4-mysql
sudo apt-get -y install php7.4-sqlite3
sudo apt-get -y install php7.4-pgsql
sudo apt-get -y install php7.4-redis
sudo apt-get -y install php7.4-memcached
sudo apt-get -y install php7.4-json
sudo apt-get -y install php7.4-zip
sudo apt-get -y install php7.4-xml
sudo apt-get -y install php7.4-soap
sudo apt-get -y install php7.4-gd
sudo apt-get -y install php7.4-imagick
sudo apt-get -y install php7.4-fileinfo
sudo apt-get -y install php7.4-imap
sudo apt-get -y install php7.4-cli
PHPINI=/etc/php/7.4/fpm/conf.d/web100now.ini
sudo touch $PHPINI
sudo cat > "$PHPINI" <<EOF
memory_limit = 256M
upload_max_filesize = 256M
post_max_size = 256M
max_execution_time = 180
max_input_time = 180
EOF
sudo service php7.4-fpm restart

sudo apt-get -y install php8.0-fpm
sudo apt-get -y install php8.0-common
sudo apt-get -y install php8.0-curl
sudo apt-get -y install php8.0-openssl
sudo apt-get -y install php8.0-bcmath
sudo apt-get -y install php8.0-mbstring
sudo apt-get -y install php8.0-tokenizer
sudo apt-get -y install php8.0-mysql
sudo apt-get -y install php8.0-sqlite3
sudo apt-get -y install php8.0-pgsql
sudo apt-get -y install php8.0-redis
sudo apt-get -y install php8.0-memcached
sudo apt-get -y install php8.0-json
sudo apt-get -y install php8.0-zip
sudo apt-get -y install php8.0-xml
sudo apt-get -y install php8.0-soap
sudo apt-get -y install php8.0-gd
sudo apt-get -y install php8.0-imagick
sudo apt-get -y install php8.0-fileinfo
sudo apt-get -y install php8.0-imap
sudo apt-get -y install php8.0-cli
PHPINI=/etc/php/8.0/fpm/conf.d/web100now.ini
sudo touch $PHPINI
sudo cat > "$PHPINI" <<EOF
memory_limit = 256M
upload_max_filesize = 256M
post_max_size = 256M
max_execution_time = 180
max_input_time = 180
EOF
sudo service php8.0-fpm restart

sudo apt-get -y install php8.1-fpm
sudo apt-get -y install php8.1-common
sudo apt-get -y install php8.1-curl
sudo apt-get -y install php8.1-openssl
sudo apt-get -y install php8.1-bcmath
sudo apt-get -y install php8.1-mbstring
sudo apt-get -y install php8.1-tokenizer
sudo apt-get -y install php8.1-mysql
sudo apt-get -y install php8.1-sqlite3
sudo apt-get -y install php8.1-pgsql
sudo apt-get -y install php8.1-redis
sudo apt-get -y install php8.1-memcached
sudo apt-get -y install php8.1-json
sudo apt-get -y install php8.1-zip
sudo apt-get -y install php8.1-xml
sudo apt-get -y install php8.1-soap
sudo apt-get -y install php8.1-gd
sudo apt-get -y install php8.1-imagick
sudo apt-get -y install php8.1-fileinfo
sudo apt-get -y install php8.1-imap
sudo apt-get -y install php8.1-cli
PHPINI=/etc/php/8.1/fpm/conf.d/web100now.ini
sudo touch $PHPINI
sudo cat > "$PHPINI" <<EOF
memory_limit = 256M
upload_max_filesize = 256M
post_max_size = 256M
max_execution_time = 180
max_input_time = 180
EOF
sudo service php8.1-fpm restart

# PHP EXTRA
sudo apt-get -y install php-dev php-pear


# 14) PHP CLI
clear
echo "${bggreen}${black}${bold}"
echo "14) PHP CLI configuration..."
echo "${reset}"
sleep 1s

sudo update-alternatives --set php /usr/bin/php8.0



# 15) COMPOSER
clear
echo "${bggreen}${black}${bold}"
echo "15) Composer setup..."
echo "${reset}"
sleep 1s

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --no-interaction
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
composer config --global repo.packagist composer https://packagist.org --no-interaction




# 16) GIT
clear
echo "${bggreen}${black}${bold}"
echo "16) GIT setup..."
echo "${reset}"
sleep 1s

sudo apt-get -y install git
sudo ssh-keygen -t rsa -C "git@github.com" -f /etc/web100now/github -q -P ""



# 17) SUPERVISOR
clear
echo "${bggreen}${black}${bold}"
echo "17) Supervisor setup..."
echo "${reset}"
sleep 1s

sudo apt-get -y install supervisor
service supervisor restart



# 18) DEFAULT VHOST
clear
echo "${bggreen}${black}${bold}"
echo "18) Default vhost..."
echo "${reset}"
sleep 1s

NGINX=/etc/nginx/sites-available/default
if test -f "$NGINX"; then
    sudo unlink NGINX
fi
sudo touch $NGINX
sudo cat > "$NGINX" <<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html/public;
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";
    client_body_timeout 10s;
    client_header_timeout 10s;
    client_max_body_size 256M;
    index index.html index.php;
    charset utf-8;
    server_tokens off;
    location / {
        try_files   \$uri     \$uri/  /index.php?\$query_string;
    }
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }
    error_page 404 /index.php;
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }
    location ~ /\.(?!well-known).* {
        deny all;
    }
}
EOF
sudo mkdir /etc/nginx/web100now/
sudo systemctl restart nginx.service





# 19) MYSQL
clear
echo "${bggreen}${black}${bold}"
echo "19) MySQL setup..."
echo "${reset}"
sleep 1s


sudo apt-get install -y mysql-server
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Press y|Y for Yes, any other key for No:\"
send \"n\r\"
expect \"New password:\"
send \"$DBPASS\r\"
expect \"Re-enter new password:\"
send \"$DBPASS\r\"
expect \"Remove anonymous users? (Press y|Y for Yes, any other key for No)\"
send \"y\r\"
expect \"Disallow root login remotely? (Press y|Y for Yes, any other key for No)\"
send \"n\r\"
expect \"Remove test database and access to it? (Press y|Y for Yes, any other key for No)\"
send \"y\r\"
expect \"Reload privilege tables now? (Press y|Y for Yes, any other key for No) \"
send \"y\r\"
expect eof
")
echo "$SECURE_MYSQL"
/usr/bin/mysql -u root -p$DBPASS <<EOF
use mysql;
CREATE USER 'web100now'@'%' IDENTIFIED WITH mysql_native_password BY '$DBPASS';
GRANT ALL PRIVILEGES ON *.* TO 'web100now'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF



# 20) REDIS
clear
echo "${bggreen}${black}${bold}"
echo "Redis setup..."
echo "${reset}"
sleep 1s

sudo apt install -y redis-server
sudo rpl -i -w "supervised no" "supervised systemd" /etc/redis/redis.conf
sudo systemctl restart redis.service



# 21) LET'S ENCRYPT
clear
echo "${bggreen}${black}${bold}"
echo "21) Let's Encrypt setup..."
echo "${reset}"
sleep 1s

sudo apt-get install -y certbot
sudo apt-get install -y python3-certbot-nginx



# 22) NODE
clear
echo "${bggreen}${black}${bold}"
echo "22) Node/npm setup..."
echo "${reset}"
sleep 1s

curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
curl -sL https://deb.nodesource.com/setup16.x | sudo -E bash -
NODE=/etc/apt/sources.list.d/nodesource.list
sudo unlink NODE
sudo touch $NODE
sudo cat > "$NODE" <<EOF
deb https://deb.nodesource.com/node_16.x focal main
deb-src https://deb.nodesource.com/node_16.x focal main
EOF
sudo apt-get update
sudo apt -y install nodejs
sudo apt -y install npm




# 23) PANEL INSTALLATION
clear
echo "${bggreen}${black}${bold}"
echo "23) Panel installation..."
echo "${reset}"
sleep 1s


/usr/bin/mysql -u root -p$DBPASS <<EOF
CREATE DATABASE IF NOT EXISTS web100now;
EOF
clear
sudo rm -rf /var/www/html
cd /var/www && git clone https://github.com/$REPO.git html
cd /var/www/html && git pull
cd /var/www/html && git checkout $BRANCH
cd /var/www/html && git pull
cd /var/www/html && sudo unlink .env
cd /var/www/html && sudo cp .env.example .env
cd /var/www/html && php artisan key:generate
sudo rpl -i -w "DB_USERNAME=dbuser" "DB_USERNAME=web100now" /var/www/html/.env
sudo rpl -i -w "DB_PASSWORD=dbpass" "DB_PASSWORD=$DBPASS" /var/www/html/.env
sudo rpl -i -w "DB_DATABASE=dbname" "DB_DATABASE=web100now" /var/www/html/.env
sudo rpl -i -w "APP_URL=http://localhost" "APP_URL=http://$IP" /var/www/html/.env
sudo rpl -i -w "APP_ENV=local" "APP_ENV=production" /var/www/html/.env
sudo rpl -i -w "WEB100NOWSERVERID" $SERVERID /var/www/html/database/seeders/DatabaseSeeder.php
sudo rpl -i -w "WEB100NOWIP" $IP /var/www/html/database/seeders/DatabaseSeeder.php
sudo rpl -i -w "WEB100NOWPASS" $PASS /var/www/html/database/seeders/DatabaseSeeder.php
sudo rpl -i -w "WEB100NOWDB" $DBPASS /var/www/html/database/seeders/DatabaseSeeder.php
sudo chmod -R o+w /var/www/html/storage
sudo chmod -R 777 /var/www/html/storage
sudo chmod -R o+w /var/www/html/bootstrap/cache
sudo chmod -R 777 /var/www/html/bootstrap/cache
cd /var/www/html && composer update --no-interaction
cd /var/www/html && php artisan key:generate
cd /var/www/html && php artisan cache:clear
cd /var/www/html && php artisan storage:link
cd /var/www/html && php artisan view:cache
cd /var/www/html && php artisan web100now:activesetupcount
WEB100NOWBULD=/var/www/html/public/build_$SERVERID.php
sudo touch $WEB100NOWBULD
sudo cat > $WEB100NOWBULD <<EOF
$BUILD
EOF
WEB100NOWPING=/var/www/html/public/ping_$SERVERID.php
sudo touch $WEB100NOWPING
sudo cat > $WEB100NOWPING <<EOF
Up
EOF
PUBKEYGH=/var/www/html/public/ghkey_$SERVERID.php
sudo touch $PUBKEYGH
sudo cat > $PUBKEYGH <<EOF
<?php
echo exec("cat /etc/web100now/github.pub");
EOF
cd /var/www/html && php artisan migrate --seed --force
cd /var/www/html && php artisan config:cache
sudo chmod -R o+w /var/www/html/storage
sudo chmod -R 775 /var/www/html/storage
sudo chmod -R o+w /var/www/html/bootstrap/cache
sudo chmod -R 775 /var/www/html/bootstrap/cache
sudo chown -R www-data:web100now /var/www/html



# 24) LAST STEPS
clear
echo "${bggreen}${black}${bold}"
echo "24) Last steps..."
echo "${reset}"
sleep 1s

sudo chown www-data:web100now -R /var/www/html
sudo chmod -R 750 /var/www/html
sudo echo 'DefaultStartLimitIntervalSec=1s' >> /usr/lib/systemd/system/user@.service
sudo echo 'DefaultStartLimitBurst=50' >> /usr/lib/systemd/system/user@.service
sudo echo 'StartLimitBurst=0' >> /usr/lib/systemd/system/user@.service
sudo systemctl daemon-reload

TASK=/etc/cron.d/web100now.crontab
touch $TASK
cat > "$TASK" <<EOF
10 4 * * 7 certbot renew --nginx --non-interactive --post-hook "systemctl restart nginx.service"
20 4 * * 7 apt-get -y update
40 4 * * 7 DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical sudo apt-get -q -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" dist-upgrade
20 5 * * 7 apt-get clean && apt-get autoclean
50 5 * * * echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
* * * * * cd /var/www/html && php artisan schedule:run >> /dev/null 2>&1
5 2 * * * cd /var/www/html/utility/web100now-update && sh run.sh >> /dev/null 2>&1
EOF
crontab $TASK
sudo systemctl restart nginx.service
sudo rpl -i -w "#PasswordAuthentication" "PasswordAuthentication" /etc/ssh/sshd_config
sudo rpl -i -w "# PasswordAuthentication" "PasswordAuthentication" /etc/ssh/sshd_config
sudo rpl -i -w "PasswordAuthentication no" "PasswordAuthentication yes" /etc/ssh/sshd_config
sudo rpl -i -w "PermitRootLogin yes" "PermitRootLogin no" /etc/ssh/sshd_config
sudo service sshd restart
TASK=/etc/supervisor/conf.d/web100now.conf
touch $TASK
cat > "$TASK" <<EOF
[program:web100now-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/html/artisan queue:work --sleep=3 --tries=3 --max-time=3600
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=web100now
numprocs=8
redirect_stderr=true
stdout_logfile=/var/www/worker.log
stopwaitsecs=3600
EOF
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start all
sudo service supervisor restart

# 25) COMPLETE
clear
echo "${bggreen}${black}${bold}"
echo "25) Web100Now installation has been completed..."
echo "${reset}"
sleep 1s




# SETUP COMPLETE MESSAGE
clear
echo "***********************************************************"
echo "                    SETUP COMPLETE"
echo "***********************************************************"
echo ""
echo " SSH root user: Web100Now"
echo " SSH root pass: $PASS"
echo " MySQL root user: Web100Now"
echo " MySQL root pass: $DBPASS"
echo ""
echo " To manage your server visit: http://$IP"
echo " and click on 'dashboard' button."
echo " Default credentials are: administrator / 12345678"
echo ""
echo "***********************************************************"
echo "          DO NOT LOSE AND KEEP SAFE THIS DATA"
echo "***********************************************************"
