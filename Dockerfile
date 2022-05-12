FROM php:8.0.3-fpm-buster

# ตืิดตั้ง extension bcmath pdo_mysql
RUN docker-php-ext-install bcmath pdo_mysql

# สั่ง update image และติดตั้ง git zip unzip
RUN apt-get update
RUN apt-get install -y git zip unzip

# ติดตั้ง Node JS
RUN curl -SL https://deb/nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

EXPOSE 9000