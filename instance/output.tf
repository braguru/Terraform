output "ubuntu_instance_id" {
  description = "The ID of the Ubuntu EC2 instance"
  value       = aws_instance.ubuntu_instance.id
}

output "ubuntu_instance_public_ip" {
  description = "The public IP address of the Ubuntu EC2 instance"
  value       = aws_instance.ubuntu_instance.public_ip
}

output "ubuntu_instance_private_ip" {
  description = "The private IP address of the Ubuntu EC2 instance"
  value       = aws_instance.ubuntu_instance.private_ip
}

output "ami_id" {
  description = "The ID of the Ubuntu AMI used"
  value       = data.aws_ami.ubuntu.id
}


output "subnet_id" {
  description = "The ID of the selected subnet"
  value       = aws_instance.ubuntu_instance.subnet_id
}

