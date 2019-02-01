from mysql/mysql-server:5.7

ENV MYSQL_DATABASE ChatService
ENV MYSQL_USER ChatService

COPY ./Init.sql /docker-entrypoint-initdb.d/
