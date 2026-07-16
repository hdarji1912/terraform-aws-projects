# Local Values

locals {

  name_prefix = "tws-${var.environment}"

  instance_size = var.environment == "prod" ? "large" : "small"

  common_labels = merge(
    {
      project     = "TerraWeek"
      environment = var.environment
      managed_by  = "Terraform"
    },
    var.extra_labels
  )

  uppercase_developers = [
    for dev in var.developer : upper(dev)
  ]

}

# Docker Image


resource "docker_image" "nginx" {

  name         = "nginx:${var.image_tag}"

  keep_locally = false

}


# Docker Container


resource "docker_container" "web" {

  name  = "${local.name_prefix}-${var.container_name}"

  image = docker_image.nginx.image_id

  ports {

    internal = 80

    external = var.external_port

  }

  dynamic "labels" {

    for_each = local.common_labels

    content {

      label = labels.key

      value = labels.value

    }

  }

}