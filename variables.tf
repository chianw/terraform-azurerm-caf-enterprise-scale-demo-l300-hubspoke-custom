# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "contoso"
}

variable "root_name" {
  type    = string
  default = "Contoso Widgets"
}


# variables to turn on or off the deployment of management, identity and connectivity resources
variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "deploy_identity_resources" {
  type    = bool
  default = true
}

variable "deploy_management_resources" {
  type    = bool
  default = true
}


# subscription management
# Example - this variable forces an existing subscription to be moved into a CAF management group. Only the suffix of the management group is required here, the root-id is not needed
# variable "subscription_id_overrides" {
#   type = map(list(string))
#   default = {
#     "landing-zones" = [
#       "c989d764-e476-48f3-a67b-95a7f09c8ee6",
#     ]
#   }
# }

# variable "subscription_id_management" {
#   type    = string
#   default = "a28df86c-26bc-4340-895b-f7d83ae7a07b"
# }

# variable "subscription_id_identity" {
#   type    = string
#   default = "1543411c-a55d-46d6-93bf-2e585fd51376"
# }



# variables for resources deployed in management
variable "log_retention_in_days" {
  type    = number
  default = 50
}

variable "security_alerts_email_address" {
  type    = string
  default = "my_valid_security_contact@replace_me" # Replace this value with your own email address.
}

variable "management_resources_location" {
  type    = string
  default = "southeastasia"
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_management_resources_custom"
  }
}


# variables for resources deployed in identity
variable "connectivity_resources_location" {
  type    = string
  default = "southeastasia"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}
