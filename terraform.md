## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.56.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.ig](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.ssh-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.private_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_ubuntu_id"></a> [ami\_ubuntu\_id](#input\_ami\_ubuntu\_id) | AMI ID for ubuntu | `string` | `"ami-07652eda1fbad7432"` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | n/a | `string` | `"eu-central-1a"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Target aws region | `string` | `"eu-central-1"` | no |
| <a name="input_custom_tag"></a> [custom\_tag](#input\_custom\_tag) | Custom tag to track resources by this project | `string` | `"built-by-terraform"` | no |
| <a name="input_private_subnets_cidr"></a> [private\_subnets\_cidr](#input\_private\_subnets\_cidr) | n/a | `string` | `"10.0.2.0/24"` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | My SSH public key | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3G9Qi+DLDlR4J9m67otpMvOh+UydAcNs2zHFXq8QeEPkcmzuvw0sZDLTL/1w8ukVS7semlugJBR2WMDQMXzGCi/Bt1dy+7VGYylbkTTjUyr97Y55o3D3Aq/4XsQ9wMKwMj3za+pTB4sFFH/b3/zrDvtd59Rasi8QHsqtcInlSm+1OdKvwNyZLlqTzW00drPUa0BLKi3OqV3SiBIhGq4GjRp5SD2R1xdRwrxU4lzBAJepruzi95Mt/HksXo+Sa6Nk9RKdw0d6FD0dQSHYNQjad26dOg9Cj2C7ICX1y3x0opJukKY3kPbU9avuWYwMyXc7Dqt3pCFqPI0NMJJhtJmQqw4MXN+qSYx2E4PctLHn9fO4q+9NSspBWerOJQ+YUY2baK94xEc2CRIIyLWF/2+ve/a3y8K+HLY89j/3wwebverxeEJL7rJWAdEGwgBcVg0YwXi5pygZO9TpqEdumPD09ejMMgXrDSo+lyb6OGqsvtbfiKvqupkKy2bKnjnsV7Zs= MBP"` | no |
| <a name="input_public_subnets_cidr"></a> [public\_subnets\_cidr](#input\_public\_subnets\_cidr) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_subnet_cidr_block"></a> [subnet\_cidr\_block](#input\_subnet\_cidr\_block) | Subnet under the VPC | `string` | `"10.0.0.0/24"` | no |
| <a name="input_vm_instance_type"></a> [vm\_instance\_type](#input\_vm\_instance\_type) | virtual machine instance type | `string` | `"t2.micro"` | no |
| <a name="input_vm_private_ip"></a> [vm\_private\_ip](#input\_vm\_private\_ip) | Private IP for virtual machine | `string` | `"10.0.1.14"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPC network | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
| <a name="output_ubuntu_ami_id"></a> [ubuntu\_ami\_id](#output\_ubuntu\_ami\_id) | n/a |
