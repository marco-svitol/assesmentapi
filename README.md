# assesmentapi

1) We assume you already installed Minikube and Docker on your system.
2) Clone repo and run install to build tikoapi docker and deploy k8s stuff:
```
git clone git clone https://github.com/marco-svitol/assesmentapi
```
```
sudo chmod 777 install.sh & ./install.sh
```
3) API endpoints to set and to get key values are:
  
  {{host}}/api/v1/setkey
  
  {{host}}/api/v1/getkey
  
  A Redis pod is used to store data.
  
  
  
  The key:value pairs must be passed in the body. i.e. key="Homer" value="Simpson"
  
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
