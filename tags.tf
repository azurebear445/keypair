locals {
  namespace = "${var.namespace}-${var.environment}-${local.location}"

  custom_tags = {
    for k, v in var.tags["custom_tags"] : k => v
  }

  stripped_tags = {
    for k, v in var.tags : k => v
    if k != "tag_formatting_exceptions" && k != "custom_tags"
  }

  tag_formatting_exceptions = (
    length(var.tags["tag_formatting_exceptions"]) > 0 ?
    { tag_formatting_exceptions = join(",", var.tags["tag_formatting_exceptions"]) } :
    {}
  )

  tags = merge(
    {
      environment    = var.environment,
      module_name    = local.module_name,
      module_version = local.module_version
    },
    local.stripped_tags,
    local.custom_tags,
    local.tag_formatting_exceptions
  )

  ssh_public_key_tags = merge(
    local.tags,
    {
      Name = var.ssh_key_custom_name != "" ? var.ssh_key_custom_name : "${local.namespace}-ssh-key-${random_id.this.hex}"
    }
  )
}
