#mirar todas las imagenes creadas
docker images ps -a

#mirar la ultima imagen creada
docker ps images -l

#mirar los ultimas 5 imagenes creadas
docker ps  images -n 5

#Borrar una imagen
docker images rm IMAGE_ID

#borrar todas las imagenes que ya tienen stop
docker rm $(docker ps -aq)

#colocarle un nombre a la imagen
docker run -it --name nombre_imagen












