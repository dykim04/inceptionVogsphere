# 베이스 이미지 설정
FROM    debian:bullseye

# 컨테이너가 리스닝할 포트 지정
EXPOSE  3306

# 패키지 관리자 업데이트 및 필요한 패키지 설치
RUN     apt-get update
RUN     apt-get upgrade -y
RUN     apt-get -y install mariadb-server mariadb-client

# MySQL 데이터베이스를 실행할 디렉토리 생성 및 소유자 설정
RUN     mkdir -p /var/run/mysqld 
RUN     chown mysql:mysql /var/run/mysqld

# MySQL 설정 파일 복사
COPY    ./conf/my.cnf /etc/mysql/

# 데이터베이스 설정 스크립트 복사
COPY    ./tools/db-init.sh /

# 데이터베이스 설정 스크립트에 실행 권한 부여
RUN     chmod +x /db-init.sh

# 컨테이너 시작 시 실행할 명령어 설정
ENTRYPOINT sh /db-init.sh
