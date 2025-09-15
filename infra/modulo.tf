module "fg_mg_movie_shop" {
  # source = "git::https://dev.azure.com/EndavaMVD/SchoolOf2025/_git/mg_fg_terraform_module?ref=v1.0.0"
  source = "git@ssh.dev.azure.com:v3/EndavaMVD/SchoolOf2025/mg_fg_terraform_module?ref=v1.0.0"

  # Required variables
  app_name                     = "fg-mg-movie-shop"
  container_image              = "schoolof.azurecr.io/mg-fg-movie-shop-api:v1.0.0"
  resource_group_name          = var.rg_name
  container_app_environment_id = azurerm_container_app_environment.env.id

  # Optional variables (using defaults)
  container_port    = 8000
  health_check_path = "/health"
  cpu               = 0.25
  memory            = "0.5Gi"
}

