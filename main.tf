
provider ibm {
  ibmcloud_api_key      = var.ibmcloud_api_key
  region                = var.region
  ibmcloud_timeout      = 60
}

locals {
  prefix_name   = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  name   = lower(replace(var.name != "" ? var.name : "${local.prefix_name}-${var.label}", "_", "-"))
  service = "cloudcerts"

  kms_info = jsonencode({
    id = var.kms_id
    url = var.kms_private_endpoint ? var.kms_private_url : var.kms_public_url
  })

  kms_parameters = var.kms_enabled ? {
    kms_info = local.kms_info
    tek_id   = var.kms_key_crn
  } : {}

  base_parameters = var.private_endpoint ? {
    allowed_network = "private-only"
  } : {}

  parameters = merge(local.base_parameters, local.kms_parameters)
}

resource null_resource print_names {
  provisioner "local-exec" {
    command = "echo 'Resource group: ${var.resource_group_name}'"
  }
}

data ibm_resource_group resource_group {
  depends_on = [null_resource.print_names]

  name = var.resource_group_name
}

resource ibm_resource_instance cm {
  count = var.provision ? 1 : 0

  name              = "${var.name_prefix}-${local.name}"
  location          = var.region
  resource_group_id = data.ibm_resource_group.resource_group.id
  plan              = "free"
  service           = local.service
  parameters        = local.parameters
}

data ibm_resource_instance cm {
  depends_on        = [ibm_resource_instance.cm]

  name              = "${var.name_prefix}-${local.name}"
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.region
  service           = local.service
}
