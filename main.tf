provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.35.0"
}

module "optimum-scf-foundation" {
  source = "./modules/managetment-groups/optimum-scf-foundation/"
}
    