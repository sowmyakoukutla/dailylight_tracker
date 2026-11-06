output "release_name" {
  description = "Friendly name of the current app release."
  value       = random_pet.release.id
}

output "app_hash" {
  description = "SHA-256 of app/index.html."
  value       = local.app_hash
}

output "environment" {
  value = var.environment
}
