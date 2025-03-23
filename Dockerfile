# Utiliser l'image officielle PHP avec Apache
FROM php:8.1-apache

# Activer les extensions PHP nécessaires (ajoutez-en si besoin)
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copier le contenu de votre projet dans le dossier de l'application dans le conteneur
COPY . /var/www/html/

# Donner les bons droits au dossier
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exposer le port 80 (pour Apache)
EXPOSE 80

# Lancer Apache en arrière-plan
CMD ["apache2-foreground"]
