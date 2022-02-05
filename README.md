# assesmentapi

1) run install.sh to install environment, build docker and deploy k8s stuff
2) When everything is up and runnig use port forward to test. i.e.:
  k port-forward -n tikoapi tikoapi-deploy-795c8c8849-lr9q8 8080:80
3) API endpoints are:
  
  http://127.0.0.1:80/api/v1/setkey
  
  to set redis key. The key:value pairs must be passed in the body. i.e. key="Homer" value="Simpson"
  You can use curl:
  
  curl --location --request POST 'http://127.0.0.1:8080/api/v1/setkey' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Homer' \
--data-urlencode 'value=Simpson'

  
  http://127.0.0.1:80/api/vi/getkey
  
  to read redis key. Pass the key value in the body:
  
  curl --location --request GET 'http://127.0.0.1:8080/api/v1/getkey' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'key=Homer'
 
 
  
