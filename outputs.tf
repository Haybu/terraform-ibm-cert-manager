output "id" {
  description = "The Object Storage instance id"
  value       = data.ibm_resource_instance.cm.id
}

output "name" {
  description = "The Object Storage instance name"
  value       = "${var.name_prefix}-${local.name}"
  depends_on  = [data.ibm_resource_instance.cm]
}

output "crn" {
  description = "The crn of the Object Storage instance"
  value       = data.ibm_resource_instance.cm.id
}

output "location" {
  description = "The Object Storage instance location"
  value       = var.region
  depends_on  = [data.ibm_resource_instance.cm]
}

output "service" {
  description = "The name of the key provisioned for the Object Storage instance"
  value       = local.service
  depends_on = [data.ibm_resource_instance.cm]
}

output "label" {
  description = "The label used for the Object Storage instance"
  value       = var.label
  depends_on = [data.ibm_resource_instance.cm]
}

output "type" {
  description = "The type of the resource"
  value       = null
}
