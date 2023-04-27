# apply built-in Allowed locations Azure policy to Landing Zone management group

#reference  existing Allowed Locations built-in policy
data "azurerm_policy_definition" "allowed_locations" {
  display_name = "Allowed locations"
}

# assigns the Allowed locations built-in policy to contoso-landing-zones management group and restrict to eastus and westus
# resource "azurerm_management_group_policy_assignment" "allowed_locations" {
#   name                 = "AllowLocation"
#   policy_definition_id = data.azurerm_policy_definition.allowed_locations.id
#   management_group_id  = module.enterprise_scale.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"].id

#   parameters = <<PARAMETERS
# {
#   "listOfAllowedLocations": {
#     "value": ["eastus", "westus"]
#   }
# }
# PARAMETERS

# }