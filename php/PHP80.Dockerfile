FROM php:8.0.13-fpm
RUN apt -yqq update

# RUN apt-get -y install apt-utils gcc make autoconf libc-dev pkg-config libpng-dev libjpeg-dev unzip vim nano git mcedit ssh zsh wget gnupg curl
# RUN apt-get -y install zlib1g-dev libmemcached-dev libzip-dev

# RUN docker-php-ext-configure \
#         gd --with-jpeg \
# 	&& docker-php-ext-install \
# 	    pdo_mysql \
# 	    mysqli \
# 	    gd

# RUN apt-get install -y libmcrypt-dev
# RUN pecl install mcrypt-1.0.4 && docker-php-ext-enable mcrypt
# RUN echo "extension=mcrypt.so" > /usr/local/etc/php/conf.d/mcrypt.ini

# RUN pecl install mongodb
# RUN echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongo.ini

# RUN pecl install zip
# RUN echo "extension=zip.so" > /usr/local/etc/php/conf.d/zip.ini

# RUN pecl install mailparse
# RUN echo "extension=mailparse.so" > /usr/local/etc/php/conf.d/mailparse.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN cd /usr/local/etc/php/conf.d/ && \
    echo 'memory_limit = -1' >> /usr/local/etc/php/conf.d/z-docker-php-memlimit.ini && \
    echo 'log_errors = on' >> /usr/local/etc/php/conf.d/z-docker-php-custom.ini
