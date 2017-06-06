#####
# PHP 7.0 bundled with the Awesome Caddy webserver
######
FROM ahgora/alpine-php71-build

# Repository/Image Maintainer
MAINTAINER Weslley Camilo

# Copy Caddyfile and entry script
COPY Caddyfile /var/www/Caddyfile

#Define Labels for the openshift.
LABEL \
      io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.s2i.scripts-url=image:///usr/libexec/s2i

COPY ./s2i/bin/ /usr/libexec/s2i

# Application directory
#WORKDIR "/var/www/app"

RUN chown -R 1001:0 /var/www && chmod -R ug+rwx /var/www
USER 1001

# Expose webserver port
EXPOSE 8080
