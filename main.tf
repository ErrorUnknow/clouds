terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6"
    }
  }
}

provider "docker" {}

module "mon_infra" {
  # Syntaxe HTTPS (pour les dépôts publics) :
  source = "github.com/thomasedel/terraform"

  container_count = 3
  image_name      = "nginx:latest"
  memory_limit    = 256
  is_privileged   = false
  starting_port   = 3000 
}
