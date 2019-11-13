# Get azure subscription for policy scope and exclusions
data "azurerm_subscription" "current" {}

variable "mg_parent_id" {
    type = "string"
    description = "The id of the root management group"
    default = "cfab5db4-0424-4ef0-94de-45eb9d20fe36"
}

variable "scope" {
    type = "string"
    description = ""
    default = "/providers/Microsoft.Management/managementGroups/ee610f30-7764-490b-b1b6-54270c04ab4d"
}