variable "container_count" {
  description = "Number of containers to create"
  type        = number
  default     = 1

  validation {
    condition     = var.container_count > 0
    error_message = "You must create at least one container."
  }
}

variable "container_memory" {
  description = "Memory limit in MB"
  type        = number
  default     = 256

  validation {
    condition     = var.container_memory >= 64
    error_message = "Container memory must be at least 64 MB."
  }
}

variable "starting_port" {
  description = "Starting external port"
  type        = number
  default     = 8000

  validation {
    condition     = var.starting_port > 1024 && var.starting_port < 65535
    error_message = "Starting port must be between 1025 and 65534."
  }
}

variable "image" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"

  validation {
    condition     = length(var.image) > 0
    error_message = "Image cannot be empty."
  }
}

variable "container_name_prefix" {
  description = "Prefix for container names"
  type        = string
  default     = "terraform-container"

  validation {
    condition     = length(var.container_name_prefix) > 0
    error_message = "Container name prefix cannot be empty."
  }
}

variable "privileged" {
  description = "Run container in privileged mode"
  type        = bool
  default     = false
}
