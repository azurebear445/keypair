variable "environment" {
  type        = string
  description = "The environment where the resources created by this Terraform configuration will be deployed. Must be one of: box|dev|dr|prod|qa|stage|uat."

  validation {
    condition = (
      var.environment == "box" ||
      var.environment == "dev" ||
      var.environment == "dr" ||
      var.environment == "prod" ||
      var.environment == "qa" ||
      var.environment == "stage" ||
      var.environment == "uat"
    )
    error_message = "The environment variable must be one of: box, dev, dr, prod, qa, stage, or uat."
  }
}

variable "location" {
  type        = string
  description = "Region to create resources in. Must be one of: eastus, northcentralus."

  validation {
    condition = (
      var.location == "eastus" ||
      var.location == "northcentralus"
    )
    error_message = "Location must be one of: eastus, northcentralus."
  }
}

variable "namespace" {
  type        = string
  description = "Namespace for resources created by this Terraform configuration."

  validation {
    condition     = length(var.namespace) < 32 && can(regex("^[a-z-]+$", var.namespace))
    error_message = "Must contain only lowercase letters and dashes, under 32 characters."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where SSH Public Key will be created."
}

variable "rsa_bits" {
  type        = number
  description = "The number of bits for the RSA key. Must be one of: 2048, 4096."
  default     = 4096

  validation {
    condition     = var.rsa_bits == 2048 || var.rsa_bits == 4096
    error_message = "The rsa_bits variable must be one of: 2048, 4096."
  }
}

variable "ssh_key_custom_name" {
  type        = string
  description = "Set a custom name for the SSH public key if it is being imported so the suffix is not randomly generated."
  default     = ""
}

variable "tags" {
  type = object({
    appgid                    = optional(string)
    appid                     = optional(string)
    architecture              = string
    custom_tags               = optional(map(any), {})
    owner                     = string
    project                   = optional(string)
    purpose                   = string
    tag_formatting_exceptions = optional(list(string), [])
    terraform_resource        = string
  })
  description = "Map of tags to apply to module resources. Must include architecture, owner, purpose, terraform_resource, and one of appid|appgid|project."

  validation {
    condition = (
      (
        var.tags["appid"] != null ||
        var.tags["appgid"] != null ||
        var.tags["project"] != null
      ) &&
      alltrue([
        for k, v in var.tags : can(regex("^[-@.a-z0-9_]+$", v)) || v == null || contains(var.tags["tag_formatting_exceptions"], k)
        if k != "purpose" && k != "tag_formatting_exceptions" && k != "custom_tags"
      ])
    )
    error_message = "The keys in the tags map must include: architecture, owner, purpose, terraform_resource, and one of appid|appgid|project. Values for tags other than \"purpose\" must be all lowercase and use underscores."
  }

  validation {
    condition = (
      (
        var.tags["architecture"] == "native" ||
        var.tags["architecture"] == "legacy" ||
        var.tags["architecture"] == "migrations"
      ) ||
      contains(var.tags["tag_formatting_exceptions"], "architecture")
    )
    error_message = "The architecture tag must have a value of \"native\"|\"legacy\"|\"migrations\"."
  }

  validation {
    condition = (
      (
        length(var.tags["purpose"]) > 40 &&
        can(regex("^[A-Z][-.* A-Za-z]+[.]$", var.tags["purpose"]))
      ) ||
      contains(var.tags["tag_formatting_exceptions"], "purpose")
    )
    error_message = "The purpose tag must begin with a capital letter, be over 40 characters, and end with a period \".\"."
  }

  validation {
    condition     = var.tags["terraform_resource"] == "true"
    error_message = "The terraform_resource tag must have a value of \"true\"."
  }
}
