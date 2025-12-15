output "node-port" {
  value = kubernetes_service_v1.lab-service.spec[0].port[0].node_port
}
