terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "2.22.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }
  }
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
}


resource "random_pet" "aksrandom" {

}

# DATA SOURCE FOR AKS


