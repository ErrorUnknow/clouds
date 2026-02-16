output "container_names" {
  description = "Names of created containers"
  value       = docker_container.containers[*].name
}

output "container_ports" {
  description = "Exposed ports"
  value = [
    for i in range(var.container_count) :
    var.starting_port + i
  ]
}
