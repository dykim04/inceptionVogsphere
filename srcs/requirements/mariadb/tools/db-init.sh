#!/bin/bash

# MySQL 데이터베이스 초기화를 위해 mysql_install_db 실행
mysql_install_db --user=root

# SQL 쿼리를 sql 파일에 저장
echo "CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
FLUSH PRIVILEGES;
USE ${WP_DB_NAME};
CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PWD}';
GRANT ALL PRIVILEGES ON * TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}';" > sql

# mysqld를 root 사용자로 부트스트랩하여 sql 파일 실행
mysqld -uroot --bootstrap < sql

# mysqld를 root 사용자로 실행
mysqld -uroot
