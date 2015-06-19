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
        php-pear \
        php5-intl \
        php5-json \
        php5-apcu && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
	a2enmod rewrite setenvif ssl  && \
	sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf && \
	sed -i "s/IncludeOptional sites-enabled/IncludeOptional \/config\/sites-enabled" && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

# mountable directory
VOLUME ["/data","/config"]

EXPOSE 80 443

ENV APACHE_LOG_DIR=/data/logs    


