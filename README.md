# assesmentapi

1) run install.sh to install environment, build docker and deploy k8s stuff
2) When everything is up and runnig use port forward to test. i.e.:
  k port-forward -n tikoapi tikoapi-deploy-795c8c8849-lr9q8 8080:80
3) API endpoints are:
  
  {{host}}/api/v1/setkey
  {{host}}/api/v1/getkey
  
  to set redis key. The key:value pairs must be passed in the body. i.e. key="Homer" value="Simpson"
  
  You can get url:port assigned by minikube with:
  
  ```
  minikube service tikoapi-deploy -n tikoapi --url
  ```
  
  and then curl it. Otherwise use a single line pipe cmd:
  
```
minikube service tikoapi-deploy -n tikoapi --url | \
curl --location --request POST "$(</dev/stdin)"/api/v1/setkey \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Homer' --data-urlencode 'value=Simpson'
```
  
  To read redis key. Pass the key value in the body:
  
```
minikube service tikoapi-deploy -n tikoapi --url | \
curl --location --request GET "$(</dev/stdin)"/api/v1/getkey \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Homer'
```
