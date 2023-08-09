#la arquitectura puede cambiar de acuerdo al sistema operativo
#FROM --platform=linux/amd64 node:19.2.0-alpine3.16
FROM node:19.2.0-alpine3.16 as deps
# /app

#cd app es la ruta de app.js de la aplicación
WORKDIR /app
COPY package.json ./
#Instalar las dependencias
RUN npm install


#construir el builderx llamando builder
FROM node:19.2.0-alpine3.16 as builder
WORKDIR /app
COPY --from=deps /app/node_modules app/node_modules
#Dest /app
COPY . .
RUN npm run test


#construir el builderx llamando builder
FROM node:19.2.0-alpine3.16 as prod-deps
WORKDIR /app
#instalar unicamente las dependencias de producción
RUN npm install --prod


#construir el builderx llamando runner
FROM node:19.2.0-alpine3.16 as runner
WORKDIR /app
COPY --from=deps /app/node_modules app/node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]



#docker build -t node-app .   "se debe ejecutar en la carpeta donde se encuentra el dockerfile para crear la imagen"
#para subir la imagen a docker hub  la creamos en el portal de docker hub 
#creamos la imagen con el comando "docker image tag nombre-reposory gregoryreyesp/nodejsapp:tagname" creado en docker hub
#nos autenticamos con "docker login" y luego ejecutamos "docker push gregoryreyesp/nodejsapp:tagname" para subir la imagen a docker hub
#recargar la pagina de docker hub y ya debe aparecer la imagen creada


#PRUEBA AUTOMATICAS DE LA IMAGEN
#Creamos una carpeta tasks y dentro de ella un archivo llamado test.js
#Creamos otra carpeta llamada tests dentro de ella otra carpeta llamada tasks y dentro de ella un archivo con la extensión .test.js
#con docker build -t imagen es para crear la imagen de nuestro dockerfile
#con docker container run -d Image_ID imagen es para ejecutar la imagen
#con docker exec -it 5e8 /bin/sh es para entrar al contenedor












