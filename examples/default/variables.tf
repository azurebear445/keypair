# Variables can be defined here if needed

variable "client_id" {
  type        = string
  description = "Azure client ID for authentication."
}

variable "client_secret" {
  type        = string
  description = "Azure client secret for authentication."
  sensitive   = true
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID."
}
