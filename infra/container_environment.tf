resource "azurerm_container_app_environment" "env" {
  name                = "school-of-app-env"
  location            = var.location
  resource_group_name = var.rg_name
  logs_destination    = "azure-monitor"

  tags = {
    EndDate      = "30/06/2026"
    ProjectCode  = "MSDLATAM_UK"
    ProjectName  = "MVDInternal - Uruguai"
    ServiceNowID = "RITM0500391"
  }

}

