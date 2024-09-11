# Terraform Backend Configuration
terraform {
  backend "azurerm" {
    resource_group_name  = azurerm_resource_group.tfexample.name
    storage_account_name = azurerm_storage_account.terraform_state.name
    container_name       = azurerm_storage_container.terraform_state.name
    key                  = "terraform.terraform_state"
  }
}
