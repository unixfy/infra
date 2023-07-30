# azurerm

This directory defines my Azure deployments with Bicep - it's infrastructure as code!

## How does it work?

There's a GitHub Actions workflow set up to automatically deploy bicep templates in the `azurerm` directory. The **name of the bicep file** is the name of the resource group to which the template will be deployed.

**Note**: The GitHub Actions workflow is set to deploy in **complete** mode, so any resources that don't exist in the bicep template but do exist in the resource group will be deleted without confirmation.
