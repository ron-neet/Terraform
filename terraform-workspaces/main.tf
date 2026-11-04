terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "environment" {
  filename = "${terraform.workspace}.txt"

  content = "This is the ${terraform.workspace} environment."
}

output "current_environment" {
  value = terraform.workspace
}
