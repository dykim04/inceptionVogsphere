#!/bin/bash

# Wait for MySQL to be ready
until mysql -h"$DB_HOST" -u"$MARIADB_USER" -p"$MARIADB_PWD" -e "SELECT 1" >/dev/null 2>&1; do
    echo 'Waiting for MySQL to be ready...'
    sleep 1
done

echo "MySQL is ready. Proceeding with WordPress setup..."

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www

if ! wp core is-installed --allow-root --path=/var/www; then
    wp core install --allow-root --path=/var/www \
                    --url=https://dong-kim.42.fr \
                    --title=Inception \
                    --admin_user=$ADMIN_USER \
                    --admin_password=$ADMIN_PWD \
                    --admin_email=dong-kim@student.42seoul.kr \
                    --skip-email
fi

if ! wp user get ${USER_ID} --allow-root --path=/var/www &>/dev/null; then
    wp user create ${USER_ID} user42@student.42seoul.kr \
        --allow-root --path=/var/www \
        --role=author \
        --user_pass=${USER_PWD}
fi

exec php-fpm7.4 -F