FROM alpine:3.21.3 AS base

# hadolint ignore=DL3018
RUN apk upgrade --no-cache \
    && apk add --no-cache tzdata php php-pdo_mysql php-pear php-json php-session php-gmp php-gd php-sockets php-gettext php-mbstring \
       php-ctype php-ldap php-curl php-snmp php-openssl php-simplexml php-pcntl php-iconv php-opcache php-posix php-dom \
       apache2 apache2-ssl php-apache2

FROM base AS server-conf

COPY conf/etc/apache2/httpd.conf /etc/apache2/httpd.conf
COPY conf/etc/php83/php.ini /etc/php83/php.ini

FROM server-conf AS phpipam-pkg

ARG APP_VERSION=v1.7.3

WORKDIR /var/www/localhost
COPY app/phpipam-${APP_VERSION}.zip .

RUN rm -rf htdocs && \
    unzip phpipam-${APP_VERSION}.zip && \
    mv phpipam htdocs

FROM phpipam-pkg AS phpipam-www

WORKDIR /var/www/localhost

RUN mv config.docker.php config.php && chmod 666 config.php && \
    rm -rf /var/www/localhost/phpipam-"${APP_VERSION}".zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]