provider "azurerm" {
    version = "=1.35.0"
}

# 1. Import Policy test module
module "azurerm_policy_definition_test" {
    source = "../../policies/policy-test"
    mg_parent_id = "${var.mg_parent_id}"
}

# 2. Import json file with assignment parmas info
data "template_file" "policy_assignment_params" {
  template = "${file("${path.module}/asgmt-params-json/${module.azurerm_policy_definition_test.policy_name}-asgmt-params.json")}"
}

# 3. Assign policy
resource "azurerm_policy_assignment" "test" {
    name = "policy-assignment"
    scope = "${var.scope}"
    # not_scopes = ["${var.not_scopes}"]
    policy_definition_id    = "${module.azurerm_policy_definition_test.policy_id}"
    description          = "Policy Assignment created via an Acceptance Test"
    display_name         = "My Example Policy Assignment"
    parameters  = "${data.template_file.policy_assignment_params.rendered}"
}