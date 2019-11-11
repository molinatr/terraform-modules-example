output "policy_id" {
  description = "Policy Id"
  value = "${azurerm_policy_definition.test.id}"
}