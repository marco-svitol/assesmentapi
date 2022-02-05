echo "Waiting for pods liveness. tikoapi service url:"$(minikube service tikoapi-deploy -n tikoapi --url)

tikoapiurl=$(minikube service tikoapi-deploy -n tikoapi --url)

until curl -s -f -o /dev/null $tikoapiurl/health;do sleep 1;done;

echo "Pods ready. Initializing dataset"

curl --location --request POST $tikoapiurl/api/v1/setkey --header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Homer' --data-urlencode 'value=Simpson'

curl --location --request POST $tikoapiurl/api/v1/setkey --header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Jeffrey' --data-urlencode 'value=Lebowski'

curl --location --request POST $tikoapiurl/api/v1/setkey --header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Stan' --data-urlencode 'value=Smith'
