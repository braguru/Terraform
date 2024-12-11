resource "aws_security_group" "Amalitech-Website-Security-Group" {
  name        = var.sg_name
  description = "Security Group for Amalitech-Website-Instance"
  vpc_id      = var.vpc_id

  # Allow SSH access from the provided CIDR blocks
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_access
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tag
}
