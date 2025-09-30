module "resource_group" {
  source   = "../Azure/azurerm_resource_group/"
  name     = local.resource_group_name
  location = local.location
  tags     = local.tags
}

module "vnet" {
  source              = "../Azure/azurerm_virtual_network"
  name                = local.vnet_name
  resource_group_name = module.resource_group.resource_group.name
  location            = local.location
  address_space       = local.address_space
  tags                = local.tags
}

module "subnets" {
  source              = "../Azure/azurerm_subnets"
  for_each            = local.subnet
  name                = each.key
  resource_group_name = module.resource_group.resource_group.name
  vnet_name           = module.vnet.virtual_network.name
  address_prefixes    = each.value.address_space
}
