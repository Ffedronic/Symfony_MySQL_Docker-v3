FROM php:8.1-fpm-alpine

# Install APK

RUN apk update && apk add bash git

# Install Composer

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

# Install Symfony CLI

RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# WORDIR

WORKDIR /var/www/html

