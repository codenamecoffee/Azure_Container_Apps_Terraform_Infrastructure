module "fg_mg_movie_shop" {
  source = "git@ssh.dev.azure.com:v3/EndavaMVD/SchoolOf2025/mg_fg_terraform_module?ref=v1.1.1"

  # Required variables
  app_name                     = "fg-mg-movie-shop-api"
  container_image              = "schoolof.azurecr.io/mg-fg-movie-shop-api:v1.0.0"
  resource_group_name          = var.rg_name
  container_app_environment_id = azurerm_container_app_environment.env.id

  # Parameters for the blob storage container
  container_name     = "fg-mg-movie-shop-storage"
  storage_account_id = azurerm_storage_account.api_storage.id

  # Optional variables (using defaults)
  container_port    = 8000
  health_check_path = "/health"
  cpu               = 0.25
  memory            = "0.5Gi"
}

# Output the URL of your deployed API
output "fg_mg_api_url" {
  description = "Public URL to access the FG-MG Movie Shop API"
  value       = module.fg_mg_movie_shop.app_url
}

output "blob_container_name" {
  description = "Name of the created Blob Storage Container"
  value       = module.fg_mg_movie_shop.blob_container_name
}
