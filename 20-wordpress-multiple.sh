#!/bin/bash

  version: '3.8'

  services:
    maria_db_prod:
      container_name: wordpress-mariadb-1
      image: mariadb:10.8
      restart: always
      ports:
        - 3306
      volumes:
        - maria_db_prod:/var/lib/mysql
      environment:
        MARIADB_DATABASE: bitnami_wordpress
        MARIADB_PASSWORD: oZ3BZBRhg31xNFtiCDI6zC
        MARIADB_ROOT_PASSWORD: oZ3BZBRhg31xNFtiCDI6zC
        MARIADB_USER: wp
        MARIADB_MYSQL_LOCALHOST_USER: true


    wordpress_8080:
      depends_on:
        - maria_db_prod
      container_name: wordpress-wordpress-1
      image: bitnami/wordpress:6
      ports:
        - "8080:8080"
        - "8443:8443"
      restart: always
      networks:
        - wordpress-prod
      environment:
        WORDPRESS_SKIP_BOOTSTRAP: 'yes'
        WORDPRESS_DATABASE_NAME: bitnami_wordpress
        WORDPRESS_DATABASE_PASSWORD: oZ3BZBRhg31xNFtiCDI6zC
        WORDPRESS_DATABASE_USER: wp
        WORDPRESS_PASSWORD: Zoovm0YeYRGlbnTxdW6Jt3
        WORDPRESS_USERNAME: admin
        WORDPRESS_SMTP_HOST: smtp.mailgun.org
        WORDPRESS_SMTP_PORT: 587
        WORDPRESS_SMTP_USER: no-reply@notifications.lazarillo.app
        WORDPRESS_SMTP_PASSWORD: 4a44adc7d49637951f8be0bb5c505842-75cd784d-35a4f256  
      volumes:
        - wordpress_prod:/var/www/html


    maria_db_main:
      container_name: wordpress-main-mariadb-1
      image: mariadb:10.8
      restart: always
      ports:
        - 3306
      volumes:
        - maria_db_main:/var/lib/mysql
      environment:
        MARIA_PASSWORD: qwerty
        MARIADB_USER: mariadbuser
        MARIADB_ROOT_PASSWORD: qwerty
        MARIADB_DATABASE: mariadb    

    wordpress_8081:
      depends_on:
        - maria_db_main
      container_name: wordpress-main-wordpress-1
      image: bitnami/wordpress:6
      ports:
        - "8081:8080"
        - "8444:8443"
      restart: always
      networks:
        - wordpress-main
      environment:
        WORDPRESS_DATABASE_USER: wordpressuser
        WORDPRESS_DATABASE_PASSWORD: Gregory
        WORDPRESS_DB_HOST: maria_db_prod:3306
        WORDPRESS_PASSWORD: contraseña
        WORDPRESS_USERNAME: admin
        WORDPRESS_SMTP_HOST: smtp.mailgun.org
        WORDPRESS_SMTP_PORT: 587
        WORDPRESS_SMTP_USER: contraseña
      volumes:
        - wordpress_main:/var/www/html


    maria_db_testing:
      container_name: wordpress-testing-mariadb-1
      image: mariadb:10.8
      restart: always
      ports:
        - 3306
      volumes:
        - maria_db_testing:/var/lib/mysql
      environment:
        MARIADB_DATABASE: bitnami_wordpress
        MARIADB_PASSWORD: oZ3BZBRhg31xNFtiCDI6zC
        MARIADB_ROOT_PASSWORD: oZ3BZBRhg31xNFtiCDI6zC
        MARIADB_USER: wp
        MARIADB_MYSQL_LOCALHOST_USER: 'true' 

    wordpress_8083:
      depends_on:
        - maria_db_testing
      container_name: wordpress-testing-wordpress-1
      image: bitnami/wordpress:6
      ports:
        - "8083:8080"
        - "8445:8443"
      restart: always
      networks:
        - wordpress-testing
      environment:
        WORDPRESS_DATABASE_USER: wordpressuser
        WORDPRESS_DATABASE_PASSWORD: Gregory
        WORDPRESS_DB_HOST: maria_db_prod:3306
        WORDPRESS_PASSWORD: contraseña
        WORDPRESS_USERNAME: admin
        WORDPRESS_SMTP_HOST: smtp.mailgun.org
        WORDPRESS_SMTP_PORT: 587
        WORDPRESS_SMTP_USER: contraseña
      volumes:
        - wordpress_testing:/var/www/html

  networks:
    wordpress-prod:
    wordpress-main:
    wordpress-testing:      
        
  volumes:
    maria_db_prod: {}
    wordpress_prod: {}
    maria_db_main: {}
    wordpress_main: {}
    maria_db_testing: {}
    wordpress_testing: {}
