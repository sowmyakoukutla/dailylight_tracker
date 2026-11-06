# Hash of the tracker app. When app/index.html changes, the hash changes,
# so a new run shows a real diff in HCP Terraform.
locals {
  app_hash = filesha256("${path.module}/daylight/index.html")
}

# A friendly release name that changes whenever the app changes.
resource "random_pet" "release" {
  length = 2

  keepers = {
    app_hash = local.app_hash
  }
}

# Records what was "released". No cloud account needed.
resource "terraform_data" "release" {
  input = {
    name        = random_pet.release.id
    app_hash    = local.app_hash
    environment = var.environment
  }
}
