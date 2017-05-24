#####
# Ambientum 1.0
# PHP 7.0 bundled with the Awesome Caddy webserver
######
FROM ahgora/alpine-php71-build

# Repository/Image Maintainer
MAINTAINER Weslley Camilo

# Reset user to root to allow software install
#USER root

# Copy Caddyfile and entry script
COPY Caddyfile /home/default/Caddyfile


LABEL \
      io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.s2i.scripts-url=image:///usr/libexec/s2i

COPY ./s2i/bin/ /usr/libexec/s2i

# Define the running user
#USER 1001

# Application directory
WORKDIR "/var/www/app"

# Expose webserver port
EXPOSE 8080

# Starts a single shell script that puts php-fpm as a daemon and caddy on foreground

#CMD ["/home/ahgora/start.sh"]
