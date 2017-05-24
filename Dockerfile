#####
# Ambientum 1.0
# PHP 7.0 bundled with the Awesome Caddy webserver
######
FROM ahgora/alpine-php71-build

# Repository/Image Maintainer
MAINTAINER Weslley Camilo

# Copy Caddyfile and entry script
COPY Caddyfile /home/default/Caddyfile

#Define Labels for the openshift.
LABEL \
      io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.s2i.scripts-url=image:///usr/libexec/s2i

COPY ./s2i/bin/ /usr/libexec/s2i

# Application directory
WORKDIR "/var/www/app"

# Expose webserver port
EXPOSE 8080


#CMD ["/home/ahgora/start.sh"]
