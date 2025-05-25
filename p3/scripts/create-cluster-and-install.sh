#!/bin/bash

k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer
sleep 6
kubectl create namespace argocd
kubectl create namespace dev
sleep 4
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sleep 4
kubectl wait -n argocd --for=condition=Ready pods --all
sleep 4
kubectl apply -f ../confs/ingress.yaml -n argocd
sleep 4
kubectl apply -f ../confs/project.yaml -n argocd
sleep 4
kubectl apply -f ../confs/application.yaml -n argocd
