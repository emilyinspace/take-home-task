# Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Useful to determine ami id
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web" {
  ami           = var.ami_ubuntu_id
  instance_type = var.vm_instance_type

  private_ip                  = var.vm_private_ip
  subnet_id                   = aws_subnet.test_subnet.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.default.id]
  key_name                    = aws_key_pair.ssh-key.key_name

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.public_key
}

