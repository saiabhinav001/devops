# Kubernetes application

Use the short command method OR the YAML method in a fresh namespace. Both create two replicas. Do not run both methods together: they intentionally use different Deployment names and the same app label.

Prerequisites: Docker running, kubectl and Minikube installed, and internet access for the first image build. Run commands from this directory.

## Short exam method

```sh
minikube start
docker build -t flask-app:v1 .
minikube image load flask-app:v1
kubectl create deployment flask-app --image=flask-app:v1 --replicas=2
kubectl expose deployment flask-app --type=NodePort --port=5000
kubectl rollout status deployment/flask-app
kubectl get pods,svc
minikube service flask-app
```

These commands work in a terminal or PowerShell. On Linux, you can also run `bash deploy.sh` once. The create commands are for the first run; existing objects must be reused or deleted before repeating.

Open the displayed URL if a browser does not open automatically. Keep the terminal open if Minikube maintains a tunnel. Expected page: **Hello from Kubernetes!**

## Faculty-style YAML method

After creating app.py and Dockerfile, build and load the image:

```sh
minikube start
docker build -t flask-app:v1 .
minikube image load flask-app:v1
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl rollout status deployment/flask-deployment
kubectl get pods,svc
minikube service flask-service
```

The Service specifies NodePort 30007. Use the URL from `minikube service` for Docker Desktop compatibility. The local image must be loaded because this YAML uses `imagePullPolicy: Never`.

## Cleanup

For the short method:

```sh
kubectl delete service flask-app
kubectl delete deployment flask-app
```

For the YAML method:

```sh
kubectl delete -f service.yaml -f deployment.yaml
```

To stop the lab cluster, run `minikube stop`.
