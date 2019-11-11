provider "azurerm" {
    version = "=1.35.0"
}

resource "azurerm_policy_definition" "test" {
    name         = "policie1"
    policy_type  = "Custom"
    mode         = "All"
    display_name = "policie1"
    management_group_id = "${var.mg_parent_id}"
    policy_rule = <<POLICY_RULE
            {
            "if": {
            "not": {
                "field": "location",
                "in": "[parameters('allowedLocations')]"
            }
            },
            "then": {
            "effect": "audit"
            }
        }
        POLICY_RULE

    parameters = <<PARAMETERS
            {
            "allowedLocations": {
            "type": "Array",
            "metadata": {
                "description": "The list of allowed locations for resources.",
                "displayName": "Allowed locations",
                "strongType": "location"
            }
            }
        }
        PARAMETERS
}