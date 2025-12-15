variable "namespace" {
  description = "The namespace in which the cluster is created"
  type        = string
  default     = "lab-devops"
}

variable "app-name" {
  description = "The name of the app"
  type        = string
  default     = "mini-project"
}

variable "app-port" {
  description = "The port on which the app operates"
  type        = number
  default     = 80
}
