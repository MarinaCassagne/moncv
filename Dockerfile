# Défini l'OS
FROM debian:bullseye-slim
# Installation du serveur apache2
# apt paquet d'installation sur debian
RUN apt-get update && apt-get install -y apache2 && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/www/moncv/
COPY ./site /var/www/moncv/
# Défini les permissions
RUN chown -R www-data:www-data /var/www/moncv
COPY ./moncv.conf /etc/apache2/sites-available/moncv.conf
RUN a2dissite 000-default.conf && a2ensite moncv.conf && a2enmod rewrite
EXPOSE  80
CMD ["apache2ctl","-D","FOREGROUND"]
 

