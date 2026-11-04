terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "environment" {
  default = "development"
}

variable "users" {
  default = ["ronit", "admin", "developer"]
}

output "environment_name" {
  value = upper(var.environment)
}

output "environment_type" {
  value = var.environment == "production" ? "Production Server" : "Development Server"
}

resource "local_file" "users" {
  for_each = toset(var.users)

  filename = "${each.key}.txt"
  content  = "Welcome ${each.key}. Learning Terraform!"
}

resource "local_file" "servers" {
  count = 2

  filename = "server-${count.index}.txt"
  content  = "Terraform Server ${count.index}"
}
