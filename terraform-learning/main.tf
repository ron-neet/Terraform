terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "devops_learning" {
  filename = var.filename
  content  = var.content
}
