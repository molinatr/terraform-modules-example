provider "azurerm" {
    version = "=1.35.0"
}

# 1. Import policy rule
data "template_file" "policy_rule" {
  template = "${file("${path.module}/policy-json/${var.policy_name}-rule.json")}"
}

# 2. Import policy parameters
data "template_file" "policy_params" {
  template = "${file("${path.module}/policy-json/${var.policy_name}-params.json")}"
}

#  3. Create policy
resource "azurerm_policy_definition" "test" {
    name         = "${var.policy_name}"
    policy_type  = "${var.policy_type}"
    mode         = "${var.policy_mode}"
    display_name = "${var.policy_display_name}"
    management_group_id = "${var.mg_parent_id}"
    policy_rule = "${data.template_file.policy_rule.rendered}"
    parameters  = "${data.template_file.policy_params.rendered}"
}