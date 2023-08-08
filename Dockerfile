FROM php:8.2-cli


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libpq-dev libzip-dev
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get update && apt-get install -y git zlib1g-dev && docker-php-ext-install pdo pdo_mysql zip



WORKDIR /app
COPY . .
RUN composer install

CMD php artisan serve --host=0.0.0.0
EXPOSE 8000
