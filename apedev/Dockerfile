FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE
RUN apt-get update && apt-get install -y tzdata
RUN apt-get install apache2 -y
RUN apt-get install systemctl -y
RUN apt-get install curl -y

#Install Composer & NPM
RUN apt-get install composer -y
RUN apt-get install npm -y
RUN curl -fsSL https://deb.nodesource.com/setup_current.x
RUN apt-get install -y nodejs

#Install PHP
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN apt update -y

RUN apt install php8.0 libapache2-mod-php8.0 php-mbstring php-xmlrpc php-soap php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear php-mysql -y
RUN apt-get update

#Configuring Apache
RUN a2enmod rewrite
RUN a2dissite 000-default
RUN rm -rf /etc/apache2/sites-available
RUN mkdir /etc/apache2/sites-available
COPY ./a2conf/ads-for-shop.conf /etc/apache2/sites-available
COPY ./a2conf/apache2.conf /etc/apache2/
RUN a2ensite ads-for-shop.conf
RUN mkdir /var/www/html/public

#Initializing App
COPY init-app.sh /run
RUN chmod +755 /run/init-app.sh

WORKDIR /var/www/html

ENTRYPOINT ["/run/init-app.sh"]


