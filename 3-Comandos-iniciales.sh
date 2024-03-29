#información interesante sobre cómo estamos actualmente utilizando Docker
docker info

#descargando imagen de docker en mi caso bullseye puede variar
docker run debian:bullseye

#mirar docker creados
docker ps -a

#mirar el ultimo contenedor creado
docker ps -l

#mirar los ultimos 5 contenedores creados
docker ps -n 5

#comado para ver de forma resumida el docker ps
docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Ports}}"

#interactuar con el docker inactivo y entrar al contenedor y ejecutar instruciones
docker run -it debian bash

#instalar un paquete
apt-get update

#instalar el nano
apt-get install nano

#descargar contenedor servidor web apache
docker run httpd

#"RECOMENDADO"descargar contenedor servidor web apache 2 plano
docker run -d httpd

#comando para ayuda en docker
docker --help

#caracteridticas del contnedor
docker exec CONTAINER_ID uname -a

#comando para mirar el consumo del contenedor
docker stats CONTAINER_ID

#comando para mirar todo los consumos de los contenedores interacitvo
docker stats --no-stream

#comando para mirar el consumo del contenedor con formato
docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"

#Instalar comando para probar el uso de la memoria
apt update && apt install stress

#comando para terminar el proceso stress
killall stress

#paquete para administrar procesos
apt install psmisc

#Mostrar los mensajes de los contenedores activos
docker logs NAMES

#ver la ip del contenedor creado
docker inspect miwebejemplo | grep IPA

#directivas de dockerfile y crear directivas de la nueva imagen
nano Dockerfile

#dentro de las directivas de dockerfile 
From debian:latest
RUN apt update && apt install -y apache2
WORKDIR /var/wwww/html/
COPY index.html .
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]

#se puede mirar la directivas con el comando
cat Dockerfile

#creacion de imagen debianapache latest
docker build -t debianapache:latest .

#arrancar la imagen debianapache
docker run -d --name miapache  debianapache

#ver el historial de la imagen creada
docker history debianapache

#ver la información del historial
docker info | less

#compartir información entre contenedores
docker run -d --name miapache2 --volumes-from miapache debianapache

#mirar la IP en el anfitrion
ip -c a

#comando para mirar puertos en el anfitrion
ss -ltp

#creacion de un contenedor con un puerto especifico
docker run -p 8081:80 -d --name apache3 httpd

#miramos y copiamos la inet con el puerto creado IP anfitrion, despues del comando ip -c a en un buscador deberia aparecer el It works!
http://147.182.200.204:8081/

#lanzar a un servidor web en una red ssh comenzamos ingresando con dockerfile
nano Dockerfile

#dentro de las directivas de dockerfile copiamos lo siguiente
FROM debian: stable-slim
ARG PAQUETE \ 
    ENUM
RUN apt-get update && apt-get install -y $PAQUETE
ENV EJERCICIO=$ENUM
RUN echo 'echo el ejercicio es: $EJERCICIO' >> /root/.bashrc

RUN apt-get install -y ssh \
    && echo "PermitRoot Login yes" >> /etc/ssh/sshd_config
EXPOSE 22
ENV CLAVE=root
COPY set-clave-root.sh /root/set-clave-root.sh
RUN chmod +x /root/set-clave-root.sh

ENTRYPOINT service ssh restart && /root/set-clave-root.sh && bash

#DOCKER COMPOSE
#instalar bases de datos docker compose con mariadb y variable de entorno compatible con wordpress y una red para que se comuniquen
docker run --name basesdedatos --net=my-network -e MARIADB_ROOT_PASSWORD=123 -e MARIADB_DATABASE=wp -d mariadb:latest

#instalar wordpress con docker compose variable de entorno funcionando la bd
docker run --name wordpress --net=my-network -e WORDPRESS_DB_HOST=basesdedatos -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=123 -e WORDPRESS_DB_NAME=wp -p 8080:80 -d wordpress:latest

#instalar docker compose verificar para cambiar la version si es necesario
https://docs.docker.com/compose/install/standalone/

curl -SL https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

#verificar si esta instalado
docker-compose --version

#creammos un directorio para el docker compose y entramos con cd
mkdir wordpres-mdb

#Posterior creamos un archivo docker-compose.yml
nano docker-compose.yml

#dentro del archivo docker-compose.yml copiamos lo siguiente
version: "3"

services:
  db:
    image: mariadb:latest
    environment:
      MARIADB_ROOT_PASSWORD= 123
      MARIADB_DATABASE= wp

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    environment:
      WORDPRESS_DB_HOST= db
      WORDPRESS_DB_USER= root
      WORDPRESS_DB_PASSWORD= 123

#comando para ejecutar docker compose
docker-compose up -d

#comando para parar y eliminar docker compose
docker-compose down

#DOCKER HUB 
#crear una cuenta en docker hub
https://hub.docker.com/

#crear un repositorio en docker hub
https://hub.docker.com/repository/create

#crear un tag para subir la imagen al repositorio
docker image tag debianapache:latest nombre_usurio/debianapache:latest

#logearse en docker hub para subir la imagen al repositorio
docker login

#subir la imagen al repositorio
docker push nombre_usurio/debianapache:latest

#IMAGES

#mirar todas las imagenes creadas
docker images ps -a

#mirar la ultima imagen creada
docker ps images -l

#mirar los ultimas 5 imagenes creadas
docker ps  images -n 5

#Borrar una imagen
docker images rm IMAGE_ID

#colocarle un nombre a la imagen
docker run -it --name nombre_imagen



























