FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y lsb-release apt-transport-https ca-certificates curl software-properties-common gnupg2 wget \
    && curl -fsSL https://packages.sury.org/php/apt.gpg | apt-key add - \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get -y install php7.4 php7.4-fpm php7.4-mysql php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl mariadb-client

RUN mkdir -p /var/www && mkdir -p /run/php
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvf latest.tar.gz && mv /wordpress/* /var/www \
    && chown -R www-data:www-data /var/www \
    && rm -r /wordpress latest.tar.gz

RUN echo "[www]\n\
user = www-data\n\
group = www-data\n\
listen = 0.0.0.0:9000\n\
listen.owner = www-data\n\
listen.group = www-data\n\
pm = dynamic\n\
pm.max_children = 5\n\
pm.start_servers = 2\n\
pm.min_spare_servers = 1\n\
pm.max_spare_servers = 3\n\
clear_env = no" > /etc/php/7.4/fpm/pool.d/www.conf

RUN cat /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /var/www/
COPY ./tools/wp-init.sh /tmp/
RUN chmod +x /tmp/wp-init.sh

ENTRYPOINT [ "sh", "/tmp/wp-init.sh" ]