provider "azurerm" {
    version = "=1.35.0"
}

data "azurerm_subscription" "current" {}

# https://github.com/MicrosoftDocs/azure-docs/issues/11379
resource "azurerm_management_group" "test_mg_parent" {
  display_name = "root-management-group"
  subscription_ids = [
    "${data.azurerm_subscription.current.subscription_id}",
  ]
}

resource "azurerm_management_group" "test_mg" {
  display_name = "optimum-scf-foundation"
  parent_management_group_id = "${azurerm_management_group.test_mg_parent.id}"
  subscription_ids = [
    "${data.azurerm_subscription.current.subscription_id}",
  ]
}