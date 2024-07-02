output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
