#Install Docker Engine on Debian
https://docs.docker.com/engine/install/debian/#set-up-the-repository

#Primero actualizamos los paquetes
sudo apt-get update

#Instalamos el primer paquete
sudo apt-get install ca-certificates curl gnupg

#Agregar la clave GPG oficial de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#Use el siguiente comando para configurar el repositorio
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Actualice el aptíndice del paquete
sudo apt-get update

#Instale Docker Engine, containerd y Docker Compose
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Verifique que la instalación de Docker Engine sea exitosa ejecutando la hello-worldimagen
sudo docker run hello-world




