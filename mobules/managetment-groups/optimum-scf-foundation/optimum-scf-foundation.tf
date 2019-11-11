provider "azurerm" {
    version = "=1.35.0"
}

# data "azurerm_subscription" "current" {}

module "azurerm_policy_definition_test" {
    source = "../../policies/"
    mg_parent_id = "${var.mg_parent_id}"
}

resource "azurerm_resource_group" "test" {
  name     = "test-resources"
  location = "West Europe"
}

resource "azurerm_policy_assignment" "test" {
    name = "policy-assignment"
    # scope = "${var.mg_id}"
    scope = "${azurerm_resource_group.test.id}"
    # scope = "b1cfce23-b4a8-4d03-bd71-5288e331dbc1"
    # "${data.azurerm_subscription.current.subscription_id}"
    # /subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup
    # scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/managementGroups/${var.mg_id}"
   
    # policy_definition_id = "${azurerm_policy_definition.test.id}"
    # policy_definition_id = element(module.azurerm_policy_definition_test.policy_id,0)
    policy_definition_id    = "${module.azurerm_policy_definition_test.policy_id}"
    description          = "Policy Assignment created via an Acceptance Test"
    display_name         = "My Example Policy Assignment"
    parameters = <<PARAMETERS
        {
        "allowedLocations": {
            "value": [ "West Europe" ]
        }
        }
        PARAMETERS
}

