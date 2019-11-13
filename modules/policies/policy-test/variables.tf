
variable "mg_parent_id" {
    type = "string"
    description = "The id of the root management group"
}

variable "policy_name" {
    type = "string"
    description = "Name of the policy"
    default = "policie1"
}

variable "policy_type" {
    type = "string"
    description = "Type of the policy"
    default = "Custom"    
}

variable "policy_mode" {
    type = "string"
    description = "Mode of the policy"
    default = "All"
}

variable "policy_display_name" {
    type = "string"
    description = "Plolicy display name"
    default = "policie1"
}