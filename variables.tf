variable "location" {

  default = "Australia East"

}

variable "rg_name" {
  default = "aks-devops"

}

variable "address_space" {
  default = "10.0.0.0/8"
}

variable "address_prefixes" {
  default = "10.240.0.0/16"
}

variable "ssh_public_key" {
  default = "/home/ec2-user/.ssh/aks-prod-sshkeys/id_rsa.pub"
}

variable "windows_admin_username" {
  default = "azureuser"
}

variable "windows_admin_password" {
  default = "Passw0rd@123"
}