
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "vpc"
    Environment = var.custom_tag
  }
}

# Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
# This is a logical connection between a VPC and the internet. 
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "ig"
    Environment = var.custom_tag
  }
}

# Elastic IP for NAT GW
resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.ig]

  tags = {
    Name        = "nat_eip"
    Environment = var.custom_tag
  }
}

# The NAT GW receives traffic from a VPC and forwards it to the Internet
# The response of this traffic is returned back to our subnet
# NAT GW must be associated with the public subnet as it needs to access the internet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  depends_on    = [aws_internet_gateway.ig]

  tags = {
    Name        = "nat"
    Environment = var.custom_tag
  }
}

# A subnet that has a route table that references an internet gateway, is considered public
# This is what we will do with the subnet below, as seen later on
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-subnet"
    Environment = var.custom_tag
  }
}

# Resources in the private subnet can't be routed to the Internet GW
# They will have their internet-bound requests sent to the NAT GW 
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name        = "private-subnet"
    Environment = var.custom_tag
  }
}

# Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# First route table, for private subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "private-route-table"
    Environment = var.custom_tag
  }
}

# Second route table, for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "public-route-table"
    Environment = var.custom_tag
  }
}

# As the public route table is assigned to the VPC,
# now we create a route from this table to the internet gateway created
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Route table association of public subnet with route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

# Same as above, for private subnet and route table
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private.id
}

# Default security group for VPC and EC2 instance
resource "aws_security_group" "default" {
  name        = "default-sg"
  description = "Default security group to allow all outbound traffic and only inbound SSH"
  vpc_id      = aws_vpc.vpc.id
  depends_on  = [aws_vpc.vpc]


  # allow inbound for SSH!
  ingress {
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # allow inbound for http
  ingress {
    from_port        = 0
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Allow all egress, which is a rule that terraform by default removes
  # Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # semantically equivalent to all as per the doc above
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "default-sg"
    Environment = var.custom_tag
  }
}
