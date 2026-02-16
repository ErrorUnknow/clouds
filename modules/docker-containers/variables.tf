variable "image" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"
}

variable "container_memory" {
  description = "Memory limit in bytes"
  type        = number
  default     = 268435456
}

variable "privileged" {
  description = "Run container in privileged mode"
  type        = bool
  default     = false
}

variable "container_count" {
  description = "Number of containers to create"
  type        = number
  default     = 1
}

variable "starting_port" {
  description = "Starting external port"
  type        = number
  default     = 8000
}

variable "container_name_prefix" {
  description = "Prefix for container names"
  type        = string
  default     = "terraform-container"
}
