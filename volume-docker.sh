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






















