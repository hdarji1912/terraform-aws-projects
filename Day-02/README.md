# 🌍 TerraWeek Challenge – Day 2

**#TrainWithShubham #TerraWeekChallenge #Terraform #DevOps**
----

# 🧩 HCL Deep Dive: Variables, Types & Expressions

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-v1.13+-623CE4?style=for-the-badge&logo=terraform&logoColor=white">
  <img src="https://img.shields.io/badge/Docker-Enabled-2496ED?style=for-the-badge&logo=docker&logoColor=white">
  <img src="https://img.shields.io/badge/Challenge-TrainWithShubham-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge">
</p>

---

# 📖 About

On **Day 2** of the **TerraWeek Challenge**, I explored **HashiCorp Configuration Language (HCL)**, the language used by Terraform to define infrastructure.

Unlike Day 1, where I simply provisioned infrastructure, today's focus was on writing **clean, reusable, scalable, and maintainable Terraform configurations** using variables, expressions, local values, outputs, validation rules, and built-in functions.

To reinforce these concepts, I built a practical project using the **Docker Provider**, which automatically downloads an **Nginx Docker image** and provisions a running container based entirely on configurable variables.

---

# 🎯 Learning Objectives

✔ Understand HCL syntax

✔ Learn blocks, arguments & expressions

✔ Work with Terraform variable types

✔ Use variable validation & sensitive variables

✔ Implement local values

✔ Generate outputs

✔ Explore Terraform built-in functions

✔ Understand variable precedence

✔ Build a real Terraform project using Docker

---

# 📂 Project Structure

```
TerraWeek-Day2/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── README.md
│
└── screenshots/
    ├── project-structure.png
    ├── variables.png
    ├── main.png
    ├── outputs.png
    ├── terraform-console.png
    ├── terraform-plan.png
    ├── terraform-apply.png
    ├── terraform-output.png
    ├── docker-container.png
    └── browser-output.png
```

---

# 📌 HCL Fundamentals

Terraform configurations are written using **HashiCorp Configuration Language (HCL)**.

Every Terraform configuration is composed of three primary building blocks.

## 1️⃣ Blocks

Blocks define Terraform objects.

Example:

```hcl
resource "docker_container" "web" {

}
```

A block consists of

- Block Type
- Resource Type
- Resource Name
- Block Body

---

## 2️⃣ Arguments

Arguments configure a block.

Example

```hcl
name = "nginx-container"
```

```hcl
image = docker_image.nginx.image_id
```

Arguments are simply key-value pairs.

---

## 3️⃣ Expressions

Expressions allow Terraform to calculate values dynamically.

Examples include

- Variable References

```hcl
var.environment
```

- Local References

```hcl
local.name_prefix
```

- Resource References

```hcl
docker_image.nginx.image_id
```

- String Interpolation

```hcl
"${local.name_prefix}-${var.container_name}"
```

- Conditional Expressions

```hcl
var.environment == "prod" ? "large" : "small"
```

---

# 🔤 Variables & Data Types

Terraform variables make configurations reusable.

## Primitive Types

- String
- Number
- Bool

```hcl
variable "environment" {
  type    = string
  default = "dev"
}

variable "external_port" {
  type    = number
  default = 8080
}

variable "enable_logs" {
  type    = bool
  default = true
}
```

---

## Collection Types

- List
- Map
- Set

```hcl
variable "developer" {
  type = list(string)
}

variable "extra_labels" {
  type = map(string)
}

variable "security_groups" {
  type = set(string)
}
```

---

## Structural Types

- Object
- Tuple

```hcl
variable "server" {
  type = object({
    cpu    = number
    memory = number
  })
}

variable "ports" {
  type = tuple([
    number,
    number
  ])
}
```

---

# ✅ Variable Validation

Terraform validates user input before creating infrastructure.

```hcl
variable "environment" {

  type = string

  default = "dev"

  validation {

    condition = contains(
      ["dev","staging","prod"],
      var.environment
    )

    error_message = "Invalid Environment"

  }

}
```

---

# 🔒 Sensitive Variables

Sensitive values are hidden from Terraform output.

```hcl
variable "docker_password" {

  type = string

  sensitive = true

}
```

---

# 🧠 Local Values

Local values help avoid duplicate code.

```hcl
locals {

  name_prefix = "tws-${var.environment}"

  instance_size = var.environment == "prod" ? "large" : "small"

  common_labels = merge(
    {
      project = "TerraWeek"
      environment = var.environment
      managed_by = "Terraform"
    },
    var.extra_labels
  )

  uppercase_developers = [
    for dev in var.developer : upper(dev)
  ]

}
```

### Concepts Used

- String Interpolation
- merge()
- upper()
- Conditional Expression
- For Expression

---

# 🐳 Docker Provider Project

This project uses the **Docker Provider** instead of cloud resources to practice HCL concepts without incurring any cloud cost.

Terraform performs the following tasks automatically:

- Pulls the latest Nginx Docker Image
- Creates a Docker Container
- Maps container ports
- Generates labels dynamically
- Uses variables throughout the configuration
- Displays useful outputs

---

# ⚙ Docker Image Resource

```hcl
resource "docker_image" "nginx" {

  name = "nginx:${var.image_tag}"

  keep_locally = false

}
```

---

# 🚀 Docker Container Resource

```hcl
resource "docker_container" "web" {

  name = "${local.name_prefix}-${var.container_name}"

  image = docker_image.nginx.image_id

  ports {

    internal = 80

    external = var.external_port

  }

}
```

---

# 🏷 Dynamic Labels

Instead of manually writing labels one by one, Terraform generates them automatically.

```hcl
dynamic "labels" {

  for_each = local.common_labels

  content {

    label = labels.key

    value = labels.value

  }

}
```

---

# 📤 Outputs

Terraform outputs useful information after deployment.

```hcl
output "container_name" {
  value = docker_container.web.name
}

output "url" {
  value = format(
    "http://localhost:%d",
    var.external_port
  )
}
```

---

# 🧪 Terraform Functions

I explored several built-in Terraform functions using **terraform console**.

```bash
terraform console
```

Examples

```text
upper("terraweek")
```

```text
merge({a=1},{b=2})
```

```text
join("-",["tws","terraweek","2026"])
```

```text
length(["docker","terraform"])
```

```text
format("http://localhost:%d",8080)
```

---

# 📊 Variable Precedence

Terraform resolves variables in the following order.

```
-var
      ↓
-var-file
      ↓
*.auto.tfvars
      ↓
terraform.tfvars
      ↓
TF_VAR_
      ↓
Default Values
```

---

# 🚀 Terraform Workflow

Initialize Terraform

```bash
terraform init
```

Create Execution Plan

```bash
terraform plan \
-var="container_name=tws-web" \
-var="external_port=8080"
```

Deploy Infrastructure

```bash
terraform apply \
-var="container_name=tws-web" \
-var="external_port=8080"
```

Display Outputs

```bash
terraform output
```

Destroy Infrastructure

```bash
terraform destroy \
-var="container_name=tws-web" \
-var="external_port=8080"
```

---

# 📸 Project Screenshots

> **Replace the image paths below with your own screenshots after uploading them to the repository.**

---

## 📁 Project Structure

> **Screenshot Required**

```
screenshots/project-structure.png
```

---

## 📝 variables.tf

> **Screenshot Required**

```
screenshots/variables.png
```

---

## 📝 main.tf

> **Screenshot Required**

```
screenshots/main.png
```

---

## 📝 outputs.tf

> **Screenshot Required**

```
screenshots/outputs.png
```

---

## 💻 terraform console

> **Screenshot Required**

Show:

- upper()
- merge()
- join()
- format()

```
screenshots/terraform-console.png
```

---

## 📋 terraform plan

> **Screenshot Required**

Show successful execution plan.

```
screenshots/terraform-plan.png
```

---

## 🚀 terraform apply

> **Screenshot Required**

Show successful resource creation.

```
screenshots/terraform-apply.png
```

---

## 📤 terraform output

> **Screenshot Required**

Show outputs such as

- Container Name
- URL
- Labels
- Developers

```
screenshots/terraform-output.png
```

---

## 🐳 Docker Desktop

> **Screenshot Required**

Show the running Nginx container.

```
screenshots/docker-container.png
```

---

## 🌐 Browser Output

> **Screenshot Required**

Open

```
http://localhost:8080
```

Show the Nginx welcome page.

```
screenshots/browser-output.png
```

---

# 🎯 Key Learnings

- Learned HCL syntax and configuration structure.
- Understood blocks, arguments, and expressions.
- Worked with all Terraform variable types.
- Implemented variable validation and sensitive variables.
- Used locals to simplify configuration.
- Learned conditional expressions.
- Used for expressions to transform lists.
- Practiced Terraform built-in functions.
- Created dynamic labels using dynamic blocks.
- Managed Docker resources with Terraform.
- Understood Terraform variable precedence.
- Successfully deployed and destroyed Docker infrastructure.

---

# 🛠 Technologies Used

- Terraform
- Docker
- Visual Studio Code
- Git
- GitHub
- Linux

---

# 🏆 Challenge Outcome

✅ HCL Syntax

✅ Variables

✅ Validation

✅ Sensitive Variables

✅ Locals

✅ Outputs

✅ Built-in Functions

✅ Dynamic Blocks

✅ Docker Provider

✅ Docker Container Deployment

---

# 🙌 Conclusion

Day 2 strengthened my understanding of Terraform by moving beyond basic resource creation into writing **modular, reusable, and production-ready configurations**.

Through practical implementation with the Docker Provider, I explored HCL syntax, variable types, validation, local values, expressions, functions, outputs, and dynamic blocks. These concepts form the foundation for building scalable Infrastructure as Code and will be essential as I progress through the TerraWeek Challenge.

---

## 👨‍💻 Author

**Hardik**

DevOps Engineer | Cloud Enthusiast

---

⭐ If you found this repository helpful, consider giving it a **Star**.

