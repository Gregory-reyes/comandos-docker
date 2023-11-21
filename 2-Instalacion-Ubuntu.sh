#INSTALACIÓN DE DOCKER EN UBUNTU 20.04

#Actualizar Ubuntu 20.04
sudo apt-get update

#Uso de un repositorio a través de HTTPS
sudo apt-get install ca-certificates curl gnupg

#Agregue la clave GPG oficial de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#Comando para configurar el repositorio
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#actualizamos nuevamente con el comando 
sudo apt-get update

#Instale Docker Engine, container Docker Compose
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Verifique que la instalación de Docker Engine
sudo docker run hello-world

#creacion de un grupo de docker
sudo groupadd docker

#Comando para dar permisos al usuario https://docs.docker.com/engine/install/linux-postinstall/
sudo usermod -aG docker $USER

#creación de fichero de configuración https://docs.docker.com/config/containers/logging/json-file/
sudo nano /etc/docker/daemon.json

#Definimos parametros del tamaño maximo del sistema pegamos la rotacion de los logs 
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3" 
  }
}

#Comando para reiniciar el ubuntu
sudo systemctl reboot












