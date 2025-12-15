variable "namespace" {
  description = "The namespace in which the cluster is created"
  type        = string
  default     = "dev"
}

variable "app-port" {
  description = "The port on which the app operates"
  type        = number
  default     = 80
}

variable "image" {
  type        = string
  description = "nginx image version"
  default     = "nginx:1.25"
}

variable "replicas" {
  description = "number of replicas"
  type        = number
  default     = 1
}
