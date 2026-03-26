FROM php:8.1-cli

ARG REPO_URL
LABEL org.opencontainers.image.source=$REPO_URL

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    curl \
    git \
    libmcrypt-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -o /usr/local/bin/wait-for.sh https://raw.githubusercontent.com/eficode/wait-for/master/wait-for.sh && \
    chmod +x /usr/local/bin/wait-for.sh

WORKDIR /var/www/html

COPY . /var/www/html

RUN composer install

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
