FROM php:8.2-apache

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y default-mysql-client
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli

EXPOSE 80

