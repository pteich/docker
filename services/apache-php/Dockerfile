FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        apache2 \
        libapache2-mod-php5 \
        php5-mysqlnd \        
        php5-mcrypt \
        php5-gd \
        php5-curl \
        php5-cli \
        php-pear \
        php5-intl \
        php5-json \
        php5-sqlite \
        php5-apcu \
        curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
	echo "IncludeOptional /config/*.conf" >> /etc/apache2/apache2.conf && \
	a2enmod rewrite setenvif ssl  && \
#    echo "SetEnv PHP_INI_SCAN_DIR /config/" >> /etc/apache2/mods-available/php5.conf && \
	sed -i "s/export APACHE_LOG_DIR=\/var\/log\/apache2\$SUFFIX/export APACHE_LOG_DIR=\/data\/logs/g" /etc/apache2/envvars && \
	sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini && \
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 10M/g" /etc/php5/apache2/php.ini && \
    sed -i "s/post_max_size = .*/post_max_size = 10M/g" /etc/php5/apache2/php.ini

ADD setup /setup
ADD etc /etc

# mountable directory
VOLUME ["/data","/config"]

RUN chmod +x /setup/setup.sh

EXPOSE 80 443
