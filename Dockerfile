FROM ahgora/alpine-php71-build

# Repository/Image Maintainer
MAINTAINER Ahgora Sistemas

# Copy Caddyfile and entry script
COPY Caddyfile /var/www/Caddyfile

#Define Labels for the openshift.
LABEL \
      io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.s2i.scripts-url=image:///usr/libexec/s2i

COPY ./s2i/bin/ /usr/libexec/s2i

# Change the ownership of the folder.
RUN chown -R 1000150000:0 /var/www && chmod -R ug+rwx /var/www

# Switch to use XXXX
USER 1000150000

# Expose webserver port
EXPOSE 8080
