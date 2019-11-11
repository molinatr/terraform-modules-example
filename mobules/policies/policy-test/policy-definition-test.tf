provider "azurerm" {
    version = "=1.35.0"
}

# 1. Import policy rule
data "template_file" "policy" {
  template = "${file("${path.module}/policy-rule/testpolicy-rule.json")}"
}

# 2. Import policy parameters
data "template_file" "policy_params" {
  template = "${file("${path.module}/policy-params/testpolicy-params.json")}"
}

#  3. Create policy
resource "azurerm_policy_definition" "test" {
    name         = "policie1"
    policy_type  = "Custom"
    mode         = "All"
    display_name = "policie1"
    management_group_id = "${var.mg_parent_id}"
    policy_rule = "${data.template_file.policy.rendered}"
    parameters  = "${data.template_file.policy_params.rendered}"
}