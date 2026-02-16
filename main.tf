terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6"
    }
  }
}

provider "docker" {}

module "docker_lab" {
  source                 = "git::https://github.com/ErrorUnknow/clouds.git//modules/docker-containers"

  image                 = "nginx:latest"
  container_count       = 3
  container_memory      = 256   # en Mo
  starting_port         = 3000
  container_name_prefix = "student"
  privileged            = false
}
