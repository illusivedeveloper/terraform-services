# Azure Terraform Authentication Methods

The preferred method and simplest developer friendly for single or multiple azure subscription according to me would be to install the [azure-cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest) tool and sign-in using one of the methods mentioned [here](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli?view=azure-cli-latest).

Another preferred method used with this script is described [here](https://docs.microsoft.com/en-us/azure/terraform/terraform-install-configure).

Then in the "main.tf" terraform script specify the providers section:
```
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.44.0"
}
```
After this we can simply run ```terraform init``` and ```terraform plan``` or ```terraform apply``` which allow Terraform to run using Azure cli to authenticate.
But, for multiple subscriptions or tenants we can pass the following attributes to the ''main.tf" terraform script:
```
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.44.0"

  subscription_id = "00000000-0000-0000-0000-000000000000"
  tenant_id       = "11111111-1111-1111-1111-111111111111"
}
```
Additional input data resource attributes for the providers block in "main.tf" script can be found from here: [Argument Reference(<https://www.terraform.io/docs/providers/azurerm/index.html#argument-reference))>


Additional methods for authentication in Azure are mentioned here: [Authenticating to Azure](https://www.terraform.io/docs/providers/azurerm/index.html#authenticating-to-azure)