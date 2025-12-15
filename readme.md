This mini-project was created to practice deploying Kubernetes resources with Terraform on a local Kind cluster.  
It demonstrates a simple workflow with a Deployment running the Nginx image and a NodePort Service for external access.

- using kubectl port-forward svc/devops-service 8080:80 -n lab-devops + http://localhost:8080 to access the nginx 