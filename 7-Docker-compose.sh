#se debe crear un archivo .yml en visual studio code para la creación de docker-compose
#creación de docker-compose para subirlo se coloca el comando docker-compose up -d
version: "3.9"

services:
  db:
    container_name: postgres_database
    image: postgres:15.1
    volumes:
     # - postgres_data:/var/lib/postgresql/data #ejemplo de volumen
      - ./postgres:/var/lib/postgresql/data
    environment:
      - POSTGRES_PASSWORD=123456

  pgAdmin:
    depends_on:
      - db
    image: dpage/pgadmin4:6.17
    ports:
      - "8080:80"
    volumes:
      - ./pgadmin:/var/lib/pgadmin  
    environment:
      - PGADMIN_DEFAULT_PASSWORD=123456
      - PGADMIN_DEFAULT_EMAIL=superman@google.com

#volumes:
 # postgres_data:
 #   external: true


#comando para ejecutar docker compose se coloca el comando
docker-compose up -d

#comando para bajar el docker-compose se coloca el comando 
docker-compose down

#comando para ver  los cambios del docker compose que estan corriendo
docker-compose logs -f























