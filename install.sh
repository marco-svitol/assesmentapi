
docker build . -t tikoapi:1.0
docker pull redis

echo "uploading docker images to minikube.."
minikube image load redis:latest
minikube image load tikoapi:1.0
echo "upload to minikube complete"

kubectl apply -f ./k8s/ns.yaml
kubectl apply -f k8s
kubectl expose deployment tikoapi-deploy -n tikoapi --type=NodePort


chmod 777 ./initializedataset.sh
./initializedataset.sh

tikoapiurl=$(minikube service tikoapi-deploy -n tikoapi --url)

echo
echo
echo "install complete. Use:"
echo "curl --location --request GET "$tikoapiurl"/api/v1/getkey --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'key=Homer'"
echo "to test it."
