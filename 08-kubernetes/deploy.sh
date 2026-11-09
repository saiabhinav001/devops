#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"
minikube start
docker build -t flask-app:v1 .
minikube image load flask-app:v1
kubectl create deployment flask-app --image=flask-app:v1 --replicas=2
kubectl expose deployment flask-app --type=NodePort --port=5000
kubectl rollout status deployment/flask-app
kubectl get pods,svc
minikube service flask-app
