terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6"
    }
  }
}

# Télécharger l'image Docker
resource "docker_image" "image" {
  name         = var.image
  keep_locally = false
}

# Créer les containers
resource "docker_container" "containers" {
  count = var.container_count

  name  = "${var.container_name_prefix}-${count.index}"
  image = docker_image.image.image_id

  # Docker attend la mémoire en bytes, on convertit Mo → bytes
  memory     = var.container_memory * 1024 * 1024
  privileged = var.privileged

  ports {
    internal = 80
    external = var.starting_port + count.index
  }
}
