
docker build . -t tikoapi:1.0
docker pull redis

minikube image load redis:latest
minikube image load tikoapi:1.0

kubectl apply -f ./k8s/ns.yaml
kubectl apply -f k8s
kubectl expose deployment tikoapi-deploy -n tikoapi --type=NodePort
