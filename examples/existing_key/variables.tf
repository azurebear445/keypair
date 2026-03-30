variable "client_id" {
  description = "ID of the Terraform Service Principal."
  type        = string
}

variable "client_secret" {
  description = "Terraform Service Principal secret."
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "ID of the Subscription to deploy resources into."
  type        = string
}

variable "tenant_id" {
  description = "ID of Webster's Azure tenant."
  type        = string
}