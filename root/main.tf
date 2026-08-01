module "RGs" {
  source = "../child/RG"
  rgs    = var.rgs
}

module "Vnets" {
  source     = "../child/vnet"
  depends_on = [module.RGs]
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.Vnets]
  source     = "../child/subnet"
  subnet     = var.subnet
}
module "pip" {
  depends_on = [module.RGs]
  source     = "../child/pip"
  pip        = var.pip
}

module "nat" {
  depends_on = [module.subnet]
  source     = "../child/NAT"
  nat        = var.nat
}

module "nsg" {
  depends_on = [module.RGs]
  source     = "../child/NSG"
  nsg        = var.nsg
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../child/nic"
  nic        = var.nic
}

module "vms" {
  depends_on = [module.subnet, module.nsg, module.nic]
  source     = "../child/vm"
  vms        = var.vms
}
module "bastion" {
  depends_on = [module.subnet, module.pip]
  source     = "../child/bastion"
  bastion    = var.bastion
}

