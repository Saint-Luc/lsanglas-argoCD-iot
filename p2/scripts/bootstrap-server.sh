#!/usr/bin/env bash

mkdir /root/.kube/

curl -sfL https://get.k3s.io | sh -s - server --node-ip 192.168.56.110 --bind-address 192.168.56.110

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

ln -s /etc/rancher/k3s/k3s.yaml /root/.kube/config

kubectl apply -f /vagrant/confs/service.yml
kubectl apply -f /vagrant/confs/ingress.yml
kubectl apply -f /vagrant/confs/deployment.yml
