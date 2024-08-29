# 베이스 이미지 설정
FROM    debian:bullseye

# 컨테이너가 리스닝할 포트 지정
EXPOSE 443

# 패키지 관리자 업데이트 및 필요한 패키지 설치
RUN     apt-get update 
RUN     apt-get upgrade -y
RUN     apt-get -y install nginx openssl

# Nginx 서버 설정 파일 복사
COPY    ./conf/default /etc/nginx/sites-available

# 자체 서명 SSL 인증서 생성
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/dong-kim.key -out /etc/ssl/dong-kim.crt \
        -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=dong-kim"

# 생성된 인증서의 퍼미션 변경
RUN     chmod 700 /etc/ssl/dong-kim.crt
RUN     chmod 700 /etc/ssl/dong-kim.key

# Nginx를 실행하여 컨테이너 시작

ENTRYPOINT ["nginx", "-g", "daemon off;"]
