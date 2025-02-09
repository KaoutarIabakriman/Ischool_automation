# Utiliser l'image officielle PHP avec Apache
FROM php:8.2-apache

# Installer les extensions PHP nécessaires (par exemple, mysqli et pdo_mysql)
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Activer le module mod_rewrite d'Apache
RUN a2enmod rewrite

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier les fichiers du projet dans le conteneur
COPY ./Ischool /var/www/html/Ischool

# Changer les permissions des fichiers copiés pour qu'Apache puisse y accéder
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Mettre à jour le fichier de configuration Apache pour le répertoire de ton projet
RUN echo "DocumentRoot /var/www/html/Ischool" >> /etc/apache2/apache2.conf

# Exposer le port 80
EXPOSE 80

# Commande par défaut pour démarrer Apache
CMD ["apache2-foreground"]
