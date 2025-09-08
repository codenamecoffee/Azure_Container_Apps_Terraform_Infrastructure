resource "azurerm_container_app_environment" "env" {
  name                = "school-of-app-env"
  location            = var.location
  resource_group_name = "SchoolOf"
  logs_destination    = "azure-monitor"
}

