variable "namespace" {
  description = "The namespace in which the cluster is created"
  type        = string
  default     = "lab-devops"
}

variable "app-port" {
  description = "The port on which the app operates"
  type        = number
  default     = 80
}

variable "image" {
  type        = string
  description = "nginx image version"
  default     = "nginx:latest"
}

variable "replicas" {
  description = "number of replicas"
  type        = number
  default     = 2
}
