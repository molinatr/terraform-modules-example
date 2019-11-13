output "policy_id" {
  description = "Policy Id"
  value = "${azurerm_policy_definition.test.id}"
}

output "policy_name" {
  description = "Policy Id"
  value = "${var.policy_name}"
}