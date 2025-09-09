
resource "azurerm_container_registry" "acr" {
  name                = "schoolof"
  resource_group_name = var.rg_name
  location            = var.location

  sku           = "Basic"
  admin_enabled = false

  tags = {
    EndDate      = "30/06/2026"
    ProjectCode  = "MSDLATAM_UK"
    ProjectName  = "MVDInternal - Uruguai"
    ServiceNowID = "RITM0500391"
  }
}

import {
  to = azurerm_container_registry.acr
  id = "/subscriptions/e75f4279-a56e-444b-81f3-cc089c8a47e0/resourceGroups/SchoolOf/providers/Microsoft.ContainerRegistry/registries/schoolof"
}
