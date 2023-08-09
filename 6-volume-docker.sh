#Creación de volumen para docker
docker volume create --name nombre_volumen

#mirar los volumenes creados
docker volume ls

#inspeccionar el volumen creado
docker volume inspect nombre_volumen

#gestion de redes en docker
docker network ls

#creacion de la red
docker network create name-network

#inspeccinamos la red y copiamos la ip para conectarme a la red
docker inspect name-network

#conectar los contenedores en una misma red se coloca ambos 
docker network connect name-network nombre_contenedor 

#comando para borrar volume debe ser completo
docker volume rm nombre_volume

#Bind Volume
#creacion de un volume con node JS
docker container run \
--name nest-app \
-w /app \
-p 3000:3000 \
-v "$(pwd)":/app \
node:16-alpine3.16 \
sh -c "yarn install && yarn run start:dev"




















