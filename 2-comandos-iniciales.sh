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

#mirar el contendor con filtro
docker ps -f status=exited
docker ps -f "name=NAMES"

#docker images
docker images

#interactuar con el docker inactivo y entrar al contenedor y ejecutar instruciones
docker run -it debian bash

#instalar un paquete
apt-get update

#instalar el nano
apt-get install nano

#colocarle un nombre a la imagen
docker run -it --name Prueba debian bash

#Borrar una imagen
docker rm Prueba

#borrar todas las imagenes que ya tienen stop
docker rm $(docker ps -aq)

#descargar contenedor servidor web apache
docker run httpd

#"RECOMENDADO"descargar contenedor servidor web apache 2 plano
docker run -d httpd

#comando para inspeccionar el contenedor
docker inspect CONTAINER_ID| less

#comando para inspeccionar el contenedor con la IP
docker inspect CONTAINER_ID| grep IPAddress

#comando para parar un contenedor
docker stop CONTAINER_ID

#comando para parar todos los contenedores
docker stop $(docker ps -aq)

#comando para borrar un contenedor
docker rm CONTAINER_ID

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

#Crear nuestra propia imagen
docker commit CONTAINER_ID NOMBRE_IMAGEN
docker commit apache miweb:latest

#mirar la imagen creada
docker images

#crear un contenedor con la imagen creada
docker run -d --name miwebejemplo miweb
docker run -d -p 8080:80 miweb

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

























