This mini-project was created to practice deploying Kubernetes resources with Terraform on a local Kind cluster.  

The architecture behind the project is very simple. We have root directory with main, outputs, variables and provider tf files. We also have a app module where is all the logic. In the root main.tf we only call the module and provide it with needed variables. 

How to initiate the app: 

1) terraform init
2) terraform apply 

How to access the app: 

1) deploy with terraform
2) after the deployment open /etc/hosts and add the following row : 

127.0.0.1 project.local

3) port-forward the traffic to the ingress controller by using the following command : 

kubectl port-forward svc/ingress-nginx-controller 8080:80 -n ingress-nginx

4) http://project.local:8080



versions used : 
- terraform ~> 1.9.x
- kubernetes ~> 3.x
- nginx = 1.25