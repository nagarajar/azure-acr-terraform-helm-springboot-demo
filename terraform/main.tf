# Create a Resource Group if it doesn’t exist
resource "azurerm_resource_group" "tfexample" {
  name     = "my-resource-group" # Replace with your resource group name
}

# Create a Storage account
resource "azurerm_storage_account" "terraform_state" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tfexample.name
  location                 = azurerm_resource_group.tfexample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "my-terraform-env"
  }
}

# Create a Storage container
resource "azurerm_storage_container" "terraform_state" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}

# resource "azurerm_kubernetes_cluster" "aks" {
#   name                = "aks-cluster"
#   location            = "CENTRAL US"
#   resource_group_name = azurerm_resource_group.tfexample.name
#   dns_prefix          = "aksexample"
#
#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size = "Standard_B2s"
#   }
#
#   identity {
#     type = "SystemAssigned"
#   }
#
#   network_profile {
#     network_plugin = "azure"
#   }
# }

# Reference to the existing Azure Container Registry
data "azurerm_container_registry" "acr" {
  name                = azurerm_storage_container.terraform_state.name # Replace with your ACR name
  resource_group_name = azurerm_resource_group.tfexample.name
}

# Reference the existing Azure Container Group (ACI)
data "azurerm_container_group" "myapp" {
  name                = "my-container-group"
  resource_group_name = azurerm_resource_group.tfexample.name
}

#output "kube_config" {
#  value = azurerm_kubernetes_cluster.aks.kube_config_raw
#  sensitive = true
#}


## Grant ACR pull permissions to ACI
#resource "azurerm_role_assignment" "acrpull" {
#  principal_id         = "e79033e2-b474-4936-a1e9-3fe9283a7fe4"
#  role_definition_name = "AcrPull"
#  scope                = data.azurerm_container_registry.acr.id
#}