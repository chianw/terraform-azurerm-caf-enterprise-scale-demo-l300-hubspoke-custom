# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "contoso"
}

variable "root_name" {
  type    = string
  default = "Contoso Widgets"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "connectivity_resources_location" {
  type    = string
  default = "eastus"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}

# this variable forces an existing subscription to be moved into a CAF management group. Only the suffix of the management group is required here, the root-id is not needed
variable "subscription_id_overrides" {
  type = map(list(string))
  default = {
    "landing-zones" = [
      "c989d764-e476-48f3-a67b-95a7f09c8ee6",
    ]
  }
}