#!/bin/bash
# Nombre de la instantánea
export snapshotName="wordpresSnapshot8414"
# Nombre del grupo de recursos
export resourceGroup="nuevaPrueba_wordpress"
#localizacion de la instantánea
export myLocation="westus"
# Nombre del disco de la VM existente
export diskName="wordpress_OsDisk_1_e115dee9b872457fba9ac8d23e675a5a"
# resourceGroup de la VM existente
export resourceGroupVM="pruebas_wordpress"

#Creemos un grupo de recursos
az group create --name $resourceGroupVM --location $myLocation

# Crear una instantánea del disco
az snapshot create \
    --name $snapshotName \
    --resource-group $resourceGroupVM \
    --source "/subscriptions/bb7bce71-6ca7-4677-bc6f-a0c9db0ecdc1/resourceGroups/$resourceGroupVM/providers/Microsoft.Compute/disks/$diskName"

# Crear un nuevo disco a partir de la instantánea
newDiskName="NuevoDiskWordpress"
az disk create \
    --resource-group $resourceGroupVM \
    --name $newDiskName \
    --source wordpresSnapshot

# Crear una nueva VM utilizando el disco creado
newVmName="NuevaVMWordpress"

az vm create \
    --resource-group $resourceGroupVM \
    --name $newVmName \
    --attach-os-disk $newDiskName \
    --os-type linux \
    --location $myLocation \
    --size Standard_B1s
