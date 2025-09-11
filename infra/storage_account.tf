resource "azurerm_storage_account" "api_storage" {
  name                     = "schoolofapistorage"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    EndDate      = "30/06/2026"
    ProjectCode  = "MSDLATAM_UK"
    ProjectName  = "MVDInternal - Uruguai"
    ServiceNowID = "RITM0500391"
  }

}
