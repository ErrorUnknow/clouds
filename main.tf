terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

provider "docker" {}

# Pull image
resource "docker_image" "image" {
  name         = var.image
  keep_locally = false
}

# Containers
resource "docker_container" "containers" {
  count = var.container_count

  name  = "${var.container_name_prefix}-${count.index}"
  image = docker_image.image.image_id

  memory     = var.container_memory
  privileged = var.privileged

  ports {
    internal = 80
    external = var.starting_port + count.index
  }
}
