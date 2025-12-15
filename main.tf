module "app" {
  source    = "./modules/app"
  namespace = var.namespace
  image     = var.image
  replicas  = var.replicas
  app-port  = var.app-port
}
