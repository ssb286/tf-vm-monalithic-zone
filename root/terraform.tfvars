rgs = {
  rgs1 = {
    name     = "sarrgi"
    location = "centralindia"
  }

  rgs2 = {
    name     = "sarrgs"
    location = "southindia"
  }

  rgs3 = {
    name     = "sarrgs"
    location = "southindia"
  }
}

vnet = {
  vnet1 = {
    name                = "vent-centralindia"
    location            = "centralindia"
    resource_group_name = "sarrgi"
    address_space       = ["10.1.0.0/18"]

  }
  vnet2 = {
    name                = "vent-southlindia"
    location            = "southindia"
    resource_group_name = "sarrgs"
    address_space       = ["10.2.0.0/18"]

  }
}

subnet = {
  subnet1 = {

    name                 = "subnet_front"
    virtual_network_name = "vent-centralindia"
    location             = "centralindia"
    resource_group_name  = "sarrgi"
    address_prefixes     = ["10.1.0.0/24"]

  }

  subnet2 = {

    name                 = "subnet_back"
    virtual_network_name = "vent-centralindia"
    location             = "centralindia"
    resource_group_name  = "sarrgi"
    address_prefixes     = ["10.1.1.0/24"]

  }
  subnetbation = {

    name                 = "AzureBastionSubnet"
    virtual_network_name = "vent-centralindia"
    location             = "centralindia"
    resource_group_name  = "sarrgi"
    address_prefixes     = ["10.1.2.0/24"]

  }
  subnetappgateway = {

    name                 = "ApplicationGateway"
    virtual_network_name = "vent-centralindia"
    location             = "centralindia"
    resource_group_name  = "sarrgi"
    address_prefixes     = ["10.1.3.0/24"]

  }
}

pip = {
  pip_bastion = {
    name                = "Bastion-pip"
    resource_group_name = "sarrgi"
    location            = "centralindia"
    allocation_method   = "Static"

    tags = {
      environment = "test"
    }
  }
  pip_gateway = {
    name                = "Gateway-pip"
    resource_group_name = "sarrgi"
    location            = "centralindia"
    allocation_method   = "Static"

    tags = {
      environment = "test"
    }
  }

}

nat = {
  nat1 = {
    name                = "nat-gateway"
    location            = "centralindia"
    resource_group_name = "sarrgi"
    namenatpip          = "nat-pip"
  }
}

nsg = {
  nsgVM = {
    name                        = "nsgvm"
    location                    = "centralindia"
    resource_group_name         = "sarrgi"
    name_rule_http              = "http"
    direction                   = "Inbound"
    destination_port_range_http = "80"
    name_rule_ssh               = "ssh"
    destination_port_range_ssh  = "22"
  }
  nsgsubnet = {
    name                        = "nsgsubnet"
    location                    = "centralindia"
    resource_group_name         = "sarrgi"
    name_rule_ssh               = "ssh"
    direction                   = "Inbound"
    destination_port_range_ssh  = "22"
    name_rule_http              = "http"
    destination_port_range_http = "80"
  }
}

nic = {
  nic1 = {
    name                 = "frontvmnic"
    location             = "centralindia"
    resource_group_name  = "sarrgi"
    name_ipconfig        = "internalnic1"
    nameofdatasubnet     = "subnet_front"
    virtual_network_name = "vent-centralindia"

  }
  nic2 = {
    name                 = "backvmnic"
    location             = "centralindia"
    resource_group_name  = "sarrgi"
    name_ipconfig        = "internalnic2"
    nameofdatasubnet     = "subnet_back"
    virtual_network_name = "vent-centralindia"

  }
}

vms = {
  VM1 = {
    name                 = "front-vm-lx"
    resource_group_name  = "sarrgi"
    location             = "centralindia"
    size                 = "Standard_D2_v5"
    admin_username       = "adminuser"
    admin_password       = "Password@123"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    name_nicdata         = "frontvmnic"
  }
  VM2 = {
    name                 = "back-vm-lx"
    resource_group_name  = "sarrgi"
    location             = "centralindia"
    size                 = "Standard_D2_v5"
    admin_username       = "adminuser"
    admin_password       = "Password@123"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    name_nicdata         = "backvmnic"
  }
}
bastion = {
  bastion = {
    name                 = "bastion"
    location             = "centralindia"
    resource_group_name  = "sarrgi"
    name_ipconfig        = "Bastionpipconfig"
    dataofbastionsubnet  = "AzureBastionSubnet"
    datablockofpip       = "Bastion-pip"
    virtual_network_name = "vent-centralindia"
  }
}
