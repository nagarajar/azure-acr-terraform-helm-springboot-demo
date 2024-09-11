variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "my-acr-resource-group"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "South India"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "mycontainerregistry"
}

# variable "container_name" {
#   description = "Name of the Azure Container Instance"
#   type        = string
#   default     = "my-azure-app"
# }

variable "image_name" {
  description = "Docker image name with tag"
  type        = string
  default     = "my-azure-app:latest"
}

variable "cpu" {
  description = "Number of CPU cores for the container"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Amount of memory (in GB) for the container"
  type        = number
  default     = 1.5
}

variable "dns_name_label" {
  description = "DNS name label for the container's public IP"
  type        = string
  default     = "my-azure-app-dns"
}

# Input variable: Name of Storage Account
variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique, length between 3 and 24 characters and contain numbers and lowercase letters only."
  default     = "nagarajarstorageaccount"
}

# Input variable: Name of Storage container
variable "container_name" {
  description = "The name of the Blob Storage container."
  default     = "my-terraform-state-container"
}
