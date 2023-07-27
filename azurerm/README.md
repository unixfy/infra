# azurerm

This directory defines my Azure deployments with Bicep - it's true infrastructure as code.

To deploy: Select a subscription and deploy the `resourcegroups.bicep` file. Resource groups will be provisioned automatically.

All resource groups managed by these Bicep files will be tagged managed: true. Some RGs may exist (e.g., resource groups only containing an AAD tenant) that can't be managed with AzureRM/Bicep; those don't have this tag.