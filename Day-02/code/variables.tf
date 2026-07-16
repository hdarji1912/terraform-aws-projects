# Primitive Types

variable "environment" {
  description = "Deployment Environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging or prod."
  }
}

variable "container_name" {
  type    = string
  default = "nginx-web"
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "external_port" {
  type    = number
  default = 8080
}

variable "enable_logs" {
  type    = bool
  default = true
}


# Collection Types

variable "developer" {
  type = list(string)

  default = [
    "hardik",
    "rahul",
    "amit"
  ]
}

variable "extra_labels" {
  type = map(string)

  default = {
    owner = "Hardik"
    team  = "DevOps"
  }
}

variable "security_groups" {
  type = set(string)

  default = [
    "web",
    "ssh"
  ]
}


# Structural Types

variable "server" {
  type = object({
    cpu    = number
    memory = number
  })

  default = {
    cpu    = 2
    memory = 4
  }
}

variable "ports" {
  type = tuple([
    number,
    number
  ])

  default = [80, 443]
}


# Sensitive Variabl

variable "docker_password" {
  type      = string
  sensitive = true
}