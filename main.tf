# Configure the Azure provider
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "uksouth"

  tags = {
    Environment = "Terraform Getting Started"
    Owner = "Gerard O'Brien"
  }
}


# create virtual network

resource "azurerm_virtual_network" "vnet" {
    name = "myTFVnet"
    address_space = ["10.0.0.0/16"]
    location = "uksouth"
    resource_group_name = azurerm_resource_group.rg.name

}