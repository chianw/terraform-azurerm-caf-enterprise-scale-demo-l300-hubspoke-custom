# terraform-azurerm-caf-enterprise-scale-demo-l300-hubspoke-custom

This uses the standard example [L300 - Hub spoke with custom resources](https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BExamples%5D-Deploy-Connectivity-Resources-With-Custom-Settings)

The changes are:
- Associating one of the built-in policies "Allowed locations" to the "Landing Zones" management group and setting allowed locations as EastUS and WestUS
- Associating one of the existing subscriptions to the CAF "Landing Zones" management group

