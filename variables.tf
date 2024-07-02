# Target aws region
variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

# AMI ID for ubuntu
variable "ami_ubuntu_id" {
  type    = string
  default = "ami-07652eda1fbad7432"
}

# VPC network
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

# Subnet under the VPC
variable "subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "netif_priv_ips" {
  type    = list(string)
  default = ["10.0.0.50"]
}

# virtual machine instance type
variable "vm_instance_type" {
  type    = string
  default = "t2.micro"
}

# Private IP for virtual machine
variable "vm_private_ip" {
  type    = string
  default = "10.0.0.12"
}

variable "vpc_domain" {
  type    = string
  default = "vpc"
}

# My SSH public key
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3G9Qi+DLDlR4J9m67otpMvOh+UydAcNs2zHFXq8QeEPkcmzuvw0sZDLTL/1w8ukVS7semlugJBR2WMDQMXzGCi/Bt1dy+7VGYylbkTTjUyr97Y55o3D3Aq/4XsQ9wMKwMj3za+pTB4sFFH/b3/zrDvtd59Rasi8QHsqtcInlSm+1OdKvwNyZLlqTzW00drPUa0BLKi3OqV3SiBIhGq4GjRp5SD2R1xdRwrxU4lzBAJepruzi95Mt/HksXo+Sa6Nk9RKdw0d6FD0dQSHYNQjad26dOg9Cj2C7ICX1y3x0opJukKY3kPbU9avuWYwMyXc7Dqt3pCFqPI0NMJJhtJmQqw4MXN+qSYx2E4PctLHn9fO4q+9NSspBWerOJQ+YUY2baK94xEc2CRIIyLWF/2+ve/a3y8K+HLY89j/3wwebverxeEJL7rJWAdEGwgBcVg0YwXi5pygZO9TpqEdumPD09ejMMgXrDSo+lyb6OGqsvtbfiKvqupkKy2bKnjnsV7Zs= MBP"
}
variable "avail_zones" {
  type    = list(string)
  default = ["eu-central-1a"]
}
