terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Backend_Storage"
    storage_account_name = "gittestnoida"           # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "gitpulltest"            # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "sarv.terrafrom.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
}