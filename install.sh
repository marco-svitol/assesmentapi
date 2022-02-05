sudo apt-get update
sudo apt install docker

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

minikube start

docker build . -t tikoapi:1.0
docker pull redis

minikube image load redis:latest
minikube image load tikoapi:1.0

kubectl apply -f ./k8s/ns.yaml
Kubectl apply -f k8s
