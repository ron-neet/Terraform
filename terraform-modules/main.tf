module "development" {
  source = "./modules/file_creator"

  file_name    = "development.txt"
  file_content = "This is my development environment."
}

module "production" {
  source = "./modules/file_creator"

  file_name    = "production.txt"
  file_content = "This is my production environment."
}
