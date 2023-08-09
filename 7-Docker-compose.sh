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

#creacion de contraseña en un enviroment para que no se vea en el docker-compose
# se debe crear un archivo .env en visual studio code
MONGO_USERNAME=strider
MONGO_PASSWORD=123456789
MONGO_DB_NAME=pokemonDB

#se debe crear un archivo .yml en visual studio code para la creación de docker-compose
#creación de docker-compose para subirlo se coloca el comando docker-compose up -d
version: '3'

services:
  db:
    container_name: ${MONGO_DB_NAME}
    image: mongo:6.0
    volumes:
      - poke-vol:/data/db
    # ports:
    #   - 27017:27017
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: ${MONGO_USERNAME}
      MONGO_INITDB_ROOT_PASSWORD: ${MONGO_PASSWORD}
    command: ['--auth']
  
  mongo-express:
    depends_on:
      - db
    image: mongo-express:1.0.0-alpha.4
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: ${MONGO_USERNAME}
      ME_CONFIG_MONGODB_ADMINPASSWORD: ${MONGO_PASSWORD}
      ME_CONFIG_MONGODB_SERVER: ${MONGO_DB_NAME}
    ports:
      - 8080:8081
    restart: always

  poke-app:
    depends_on:
      - db
      - mongo-express
    image: klerith/pokemon-nest-app:1.0.0
    ports:
      - 3000:3000
    environment:
      MONGODB: mongodb://${MONGO_USERNAME}:${MONGO_PASSWORD}@${MONGO_DB_NAME}:27017
      DB_NAME: ${MONGO_DB_NAME}
    restart: always

volumes:
  poke-vol:
    external: false























