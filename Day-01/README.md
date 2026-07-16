# 🌱 TerraWeek Day 1 – Introduction to Infrastructure as Code (IaC) & Terraform   

#TrainWithShubham #TerraWeekChallenge

> **Day 1 Goal:** Learn the fundamentals of Infrastructure as Code (IaC), understand Terraform, complete the Terraform workflow, and explore OpenTofu.

---

# 📚 Learning Summary

On Day 1, I learned the fundamentals of **Infrastructure as Code (IaC)** and **Terraform**, installed and configured the Terraform CLI, created my first Terraform project, provisioned local resources, explored the Terraform workflow, and gained hands-on experience with OpenTofu and the Terraform dependency lock file.

---

# 📌 Task 1: Understanding Infrastructure as Code (IaC)

## What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) is the practice of provisioning and managing infrastructure using code instead of manual processes. It enables automation, consistency, scalability, and version control for infrastructure management.

### Benefits of IaC

- Automated infrastructure provisioning
- Consistent and repeatable deployments
- Version-controlled infrastructure
- Reduced manual errors
- Faster deployment process
- Easy collaboration using Git

---

## What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It uses HashiCorp Configuration Language (HCL) to provision and manage infrastructure across multiple cloud providers and services through a declarative approach.

### Key Features

- Multi-cloud support
- Declarative Infrastructure as Code
- Infrastructure automation
- State management
- Reusable modules
- Execution planning before deployment

---

# 📌 Terraform vs Other IaC Tools

| Tool | Description |
|------|-------------|
| **Terraform** | Declarative, multi-cloud Infrastructure as Code tool. |
| **OpenTofu** | Community-driven open-source fork of Terraform. |
| **Pulumi** | Infrastructure as Code using programming languages like Python, Go, and TypeScript. |
| **AWS CloudFormation** | Native Infrastructure as Code service for AWS. |
| **Ansible** | Configuration management and automation tool. |

---

# 📌 Task 2: Install Terraform

Installed the latest Terraform CLI and verified the installation.

### Commands

```bash
terraform version
terraform -help
```

Installed the **HashiCorp Terraform Extension** in Visual Studio Code for:

- Syntax Highlighting
- Auto Completion
- HCL Language Support
- Terraform Snippets

---

### Installation Verification

#### Terraform Version

![Terraform Version](images/01-terraform-version.png)

#### Terraform Help

![Terraform Help](images/02-terraform-help.png)

#### VS Code Extension

![VS Code Extension](images/03-vscode-extension.png)

---

# 📌 Task 3: Learn Core Terraform Concepts

| Concept | Description |
|----------|-------------|
| **Provider** | Plugin that allows Terraform to interact with cloud providers or services. |
| **Resource** | Infrastructure object managed by Terraform. |
| **State** | File that stores the current state of managed infrastructure. |
| **Plan** | Preview of infrastructure changes before deployment. |
| **HCL** | HashiCorp Configuration Language used to write Terraform configuration. |
| **Module** | Reusable collection of Terraform resources. |

---

# 📌 Task 4: First Terraform Project

Created a simple Terraform project using the **Local** and **Random** providers to understand the Terraform lifecycle without requiring any cloud account.

---

## Terraform Workflow

| Step | Command | Purpose |
|------|---------|---------|
| 1 | `terraform init` | Initialize the working directory and download providers |
| 2 | `terraform fmt` | Format Terraform configuration |
| 3 | `terraform validate` | Validate configuration syntax |
| 4 | `terraform plan` | Preview infrastructure changes |
| 5 | `terraform apply` | Create infrastructure resources |
| 6 | `terraform output` | Display output values |
| 7 | `cat greeting.txt` | Verify generated local file |
| 8 | `terraform destroy` | Remove created resources |

---

## Step 1 – Terraform Initialization

![Terraform Init](images/04-init.png)

---

## Step 2 – Format & Validate Configuration

![Terraform Format and Validate](images/05-fmt-validate.png)

---

## Step 3 – Preview Infrastructure Changes

![Terraform Plan](images/06-plan.png)

---

## Step 4 – Apply Configuration

![Terraform Apply](images/07-apply.png)

---

## Step 5 – Verify Outputs

![Terraform Output](images/08-output.png)

---

## Step 6 – Destroy Resources

![Terraform Destroy](images/09-destroy.png)

---

# 🎯 Learning Outcomes

After completing this lab, I learned how to:

- Understand Infrastructure as Code concepts
- Write basic Terraform configuration files
- Initialize Terraform providers
- Format and validate Terraform code
- Preview infrastructure changes safely
- Provision resources using Terraform
- View Terraform outputs
- Destroy infrastructure when no longer needed
- Understand Terraform state management

---

# ⭐ Bonus Tasks

Completed additional Terraform exercises.

| Task | Status |
|------|:------:|
| Terraform CLI Autocomplete | ✅ |
| OpenTofu Installation | ✅ |
| Understanding `.terraform.lock.hcl` | ✅ |

---

## Bonus 1 – Terraform CLI Autocomplete

Verified Terraform CLI autocomplete.

```bash
terraform -install-autocomplete
```

![Terraform Autocomplete](images/10-autocomplete.png)

---

## Bonus 2 – OpenTofu

Installed OpenTofu and executed the same Terraform workflow.

### Installation

```bash
sudo snap install opentofu --classic
```

### Verify Installation

```bash
tofu version
```

### Workflow

```bash
tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
tofu destroy
```

![OpenTofu](images/11-opentofu.png)

---

## Bonus 3 – Understanding `.terraform.lock.hcl`

Explored the `.terraform.lock.hcl` file generated during initialization.

### Purpose

- Locks provider versions
- Stores cryptographic checksums
- Ensures reproducible deployments
- Maintains provider consistency
- Improves security

![Terraform Lock File](images/12-lock-file.png)

---

# 📂 Repository Structure

```text
.
├── example/
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── terraform.tfvars
├── images/
├── README.md
└── .terraform.lock.hcl
```

---

# 🛠️ Technologies Used

- Terraform
- OpenTofu
- HashiCorp Configuration Language (HCL)
- Visual Studio Code
- Linux (Ubuntu)
- Git
- GitHub

---

# 🚀 Key Takeaways

- Learned the fundamentals of Infrastructure as Code (IaC).
- Understood Terraform architecture and workflow.
- Installed and configured Terraform CLI.
- Created infrastructure using Terraform.
- Executed the complete Terraform lifecycle.
- Explored OpenTofu as an open-source alternative.
- Understood the purpose of `.terraform.lock.hcl`.
- Gained practical experience with Terraform commands and best practices.

---

## ⭐ If you found this project helpful, feel free to star the repository!
