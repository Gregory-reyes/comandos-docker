
#crear un contnedor postgres despues de lo último postgres se puede especificar la version
docker container run --name nombredb-postgres -dp 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword postgres

#crear un contenedor mariadb version jammy
docker pull mariadb:lts-jammy

#crear un contenedor mariadb version jammy con variable de entorno
docker container run\
> -dp 3306:3306\
> -name maria-db\
> --env MARIADB_USER=example-user\
> --env MARIADB_PASSWORD=user-password\
> --env MARIADB_RANDOM_ROOT_PASSWORD=root-secret-password\
> --env MARIADB_DATABASE=nombredb-mariadb\
> --env volume prueba_volume:/var/lib/mysql\
> --env network my-network\
> mariadb:jammy

#ver los logs de los containers
docker container logs CONTAINER_ID

#mirar el contendor con filtro
docker container ps -f status=exited
docker container ps -f "name=NAMES"

#comando para inspeccionar el contenedor
docker inspect CONTAINER_ID| less

#comando para inspeccionar el contenedor con la IP
docker inspect CONTAINER_ID| grep IPAddress

#comando para parar un contenedor
docker container stop CONTAINER_ID

#comando para parar todos los contenedores
docker stop $(docker ps -aq)

#borrar todas los contnedores que ya tienen stop
docker rm $(docker ps -aq)

#comando para borrar un contenedor
docker rm CONTAINER_ID

#comando para borrar todos los contenedores
docker container prune

#creacion de un contenedor con un puerto especifico
docker container run -d -p 8081:80 docker/getting-started

#Crear nuestra propia imagen
docker commit CONTAINER_ID NOMBRE_IMAGEN
docker commit apache miweb:latest

#crear un contenedor con la imagen creada
docker run -d --name miwebejemplo miweb
docker run -d -p 8080:80 miweb












