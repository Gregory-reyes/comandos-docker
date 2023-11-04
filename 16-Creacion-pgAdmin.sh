#Creación del volumen
docker volume create postgres-db

# Creacion de contenedores de postgres y pgAdmin
docker container run --name postgres-db -e POSTGRES_PASSWORD=123456 -v postgres-db:/var/lib/postgresql/data -d -p 5432:5432 postgres
docker container run --name pgAdmin -e PGADMIN_DEFAULT_EMAIL=admin@gmail.com -e PGADMIN_DEFAULT_PASSWORD=123456 -d -p 80:80 dpage/pgadmin4

#creación de la red para conectar los contenedores
docker network create postgres-net

#conectar los contenedores a la red
docker network connect postgres-net postgres-db
docker network connect postgres-net pgAdmin

#Ingresamos al login de pgAdmin creando un nuevo servidor con los siguientes datos:
#ip publica del servidor:80
#usuario: admin@gmail.com
#contraseña: 123456

#creamos una base de datos con el nombre de postgres-db
#en server damos create
#en name colocamos superheroes 
#en name/host colocamos postgres-db
#en connectiondatabase colocamos postgres
#en username colocamos postgres
#en password colocamos 123456 y damos save









