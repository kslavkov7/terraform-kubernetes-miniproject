output "app_deployment_name" {
  value       = module.app.deployment-name
  description = "The name of the deployment created by the app module"
}

output "app_node_port" {
  value       = module.app.node-port
  description = "The NodePort of the service created by the app module"
}
