# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {
  provider = azurerm
}

data "azurerm_client_config" "management" {
  provider = azurerm.management
}

data "azurerm_client_config" "connectivity" {
  provider = azurerm.connectivity
}


# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "3.3.0" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  root_parent_id   = data.azurerm_client_config.core.tenant_id
  root_id          = var.root_id
  root_name        = var.root_name
  default_location = "southeastasia"
  library_path     = "${path.root}/lib"

  custom_landing_zones = {
    "${var.root_id}-production" = {
      display_name               = "${upper(var.root_id)} Production"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "scengineering"
        parameters = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["southeastasia", "eastasia"]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["southeastasia", "eastasia"]
          }
        }

        access_control = {}
      }
    }

    "${var.root_id}-development" = {
      display_name               = "${upper(var.root_id)} Development"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "scengineering"
        parameters = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["southeastasia", "eastasia"]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["southeastasia", "eastasia"]
          }
        }

        access_control = {}
      }
    }
  }



  #deploy connectivity resources
  deploy_connectivity_resources    = var.deploy_connectivity_resources
  subscription_id_connectivity     = data.azurerm_client_config.connectivity.subscription_id
  configure_connectivity_resources = local.configure_connectivity_resources

  #deploy management resources
  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = data.azurerm_client_config.management.subscription_id
  configure_management_resources = local.configure_management_resources

  #deploy identity resources
  deploy_identity_resources    = var.deploy_identity_resources
  subscription_id_identity     = data.azurerm_client_config.core.subscription_id
  configure_identity_resources = local.configure_identity_resources



  # manually associate an existing subscription to a CAF management group as defined in variable subscription_id_overrides
  # subscription_id_overrides = var.subscription_id_overrides




}



# test getting output of management group creation from the module
# output "caf_landingzone_management_group" {
#   value = module.enterprise_scale.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"]
# }



