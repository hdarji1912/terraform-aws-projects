output "container_name" {
  value = docker_container.web.name
}

output "container_id" {
  value = docker_container.web.id
}

output "image_name" {
  value = docker_image.nginx.name
}

output "instance_size" {
  value = local.instance_size
}

output "developers" {
  value = local.uppercase_developers
}

output "labels" {
  value = local.common_labels
}

output "url" {
  value = format("http://localhost:%d", var.external_port)
}