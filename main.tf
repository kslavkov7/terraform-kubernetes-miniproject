resource "kubernetes_namespace_v1" "example" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment_v1" "lab-deployment" {
  metadata {
    name      = "devops-deployment"
    namespace = var.namespace
    labels = {
      app = "MyApp"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "MyApp"
      }
    }
    template {
      metadata {
        labels = {
          app = "MyApp"
        }
      }

      spec {
        container {
          name  = "devops-container"
          image = "nginx"
          port {
            container_port = var.app-port
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "lab-service" {
  metadata {
    name      = "devops-service"
    namespace = var.namespace
  }

  spec {
    type = "NodePort"

    selector = {
      app = "MyApp"
    }


    port {
      port        = var.app-port
      target_port = var.app-port
      node_port   = 30100
    }
  }
}
