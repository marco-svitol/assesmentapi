# tikoapi setup

1) We assume you already installed Minikube and Docker on your system.
2) Clone repo and run install to build tikoapi docker, deploy k8s stuff and initialize dataset:
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
  
  and then curl it.
  
  Otherwise use a single line pipe cmd as described below.
  
  To read key values:
```
minikube service tikoapi-deploy -n tikoapi --url | \
curl --location --request GET "$(</dev/stdin)"/api/v1/getkey \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Homer'
```

and to set key values:

```
minikube service tikoapi-deploy -n tikoapi --url | \
curl --location --request GET "$(</dev/stdin)"/api/v1/getkey \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Homer'
```

### ToDo/Improvements

- use https to expose api
- add a "delete" api
- introduce auth in redis
- use secrets to store credentials
- dataset initialization managed by api pod maybe using a configmap loaded at runtime 

