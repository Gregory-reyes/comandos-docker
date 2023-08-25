#Link para instalar minikube
https://minikube.sigs.k8s.io/docs/start/

#Documentación oficial de Kubernetes
https://kubernetes.io/es/docs/concepts/

#Para iniciar  el minikube y forzar la creación de un nuevo cluster
minikube start --force

#Comando para ver la versión del cluster
kubectl version

#Comando para ver el servicio se encuentre arriba 
kubectl get all

#comando para ver el minikube service
minikube service pg-admin-service --url

#configuración services o apply para crear un pod
kubectl apply -f pod.yaml

#comando para describirme el pod
kubectl describe pod pod-nginx

#comando para ver los logs del pod
kubectl logs pod-nginx

#configuración apply para crear un deployment
kubectl apply -f deployment.yaml

#configuración apply para crear un service
kubectl apply -f service.yaml

#comaando para desplegar el backend
kubectl apply -f backend-secrets.yml
kubectl apply -f backend.yml

#comando para reiniciar el deployment
kubectl rollout restart deployment backend

#comando para probar nuestro servicio de backend
minikube service backend-service --url

#copiamos el url y lo pegamos en el navegador /api en el caso del backend creado

#comando para desplegar nuestro servicio de pgadmin
minikube service pg-admin-service --url

#comando para hacer limpieza del mini kube
minikube delete --all










