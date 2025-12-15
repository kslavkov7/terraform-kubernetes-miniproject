This mini-project was created to practice deploying Kubernetes resources with Terraform on a local Kind cluster.  

The architecture behind the project is very simple. We have root directory with main, outputs, variables and provider tf files. We also have a app module where is all the logic. In the root main.tf we only call the module and provide it with needed variables. 

How to initiate the app: 

1) terraform init
2) terraform apply 

How to access the app: 

1) kubectl port-forward svc/devops-service 8080:80 -n lab-devops (that's used to port-forward the service and make it accessible in our browser using our local port 8080)

2) http://localhost:8080
