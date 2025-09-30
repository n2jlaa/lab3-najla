locals {
  resource_group_name = "udemy-course-rg-najl"
  vnet_name           = "udemy-course-vnet-najla"
  location            = "West Europe"

  tags = {
    bootcamp = "udemy-course"
  }

  address_space = ["10.0.0.0/16"]

  subnet = {
    public_subnet = {
      address_space = ["10.0.2.0/24"]
    }
    private_subnet = {
      address_space = ["10.0.3.0/24"]
    }
  }
}
