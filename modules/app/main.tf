resource "kubernetes_namespace_v1" "example" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment_v1" "lab-deployment" {
  metadata {
    name      = "${var.namespace}-deployment"
    namespace = var.namespace
    labels = {
      app = "MyApp"
    }
  }

  spec {
    replicas = var.replicas
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
        volume {
          name = "nginx-volume"
          config_map {
            name = kubernetes_config_map_v1.test-cm.metadata[0].name
          }
        }
        container {
          name  = "${var.namespace}-container"
          image = var.image
          port {
            container_port = var.app-port
          }
          volume_mount {
            name       = "nginx-volume"
            mount_path = "/usr/share/nginx/html/"
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "lab-service" {
  metadata {
    name      = "${var.namespace}-service"
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

resource "kubernetes_config_map_v1" "test-cm" {
  metadata {
    name      = "nginx-config"
    namespace = var.namespace
  }
  data = {
    "index.html" = "<html><body>Hello from Terraform + Kubernetes!</body></html>"
  }
}
