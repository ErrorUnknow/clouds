output "container_names" {
  value = docker_container.containers[*].name
}

output "container_ports" {
  value = [
    for i in range(var.container_count) :
    var.starting_port + i
  ]
}
