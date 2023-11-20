#!/bin/bash

version: '3.3'

services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: Gregory
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpressuser
       MYSQL_PASSWORD: Gregory

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpressuser
       WORDPRESS_DB_PASSWORD: Gregory
       WORDPRESS_DB_NAME: wordpress
volumes:
    db_data: {}













