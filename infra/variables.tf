variable "rg_name" {
  description = "Nombre del Resource Group"
  type        = string
  default     = "school-of-2025"
}

variable "location" {
  description = "Región de Azure (ej. eastus, westeurope)"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Mapa de tags comunes"
  type        = map(string)
  default = {
    ManagedBy = "terraform"
    Project   = "demo"
  }
}
