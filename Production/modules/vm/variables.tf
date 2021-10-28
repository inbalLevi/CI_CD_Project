variable "location" {
  description = "Region to build into"
  default     = "westeurope"

}


variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "Ansible_Production_Resource_Group"
}

variable "public_vm_size" {
  type        = string
  description = "Vm-Size Config"
  default     = "Standard_B2s"
}

variable "network_interface_ids"{
  type        = list(string)
  default = ["azurerm_network_interface.nic.id", "azurerm_network_interface.nic2.id", "azurerm_network_interface.nic3.id"]
  
}

variable "admin_username" {
  type        = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Password must meet Azure complexity requirements"
}

