data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  # key_name        = var.key_pair_name
  security_groups = var.aws_security_group
  availability_zone = var.availability_zone

  root_block_device {
    volume_size = 24
    delete_on_termination = true
    volume_type = "gp3"
  }

  # User data script to install Docker
  user_data = <<-EOF
              #!/bin/bash

              mkfs.ext4 /dev/xvda  # Format the custom root EBS volume
              mount /dev/xvda /mnt  # Mount the volume
              mount --bind /mnt /  # Bind mount to root

              # Detect the attached volume (e.g., /dev/xdva)
              DEVICE=/dev/xvda
              MOUNT_POINT=/data

              # Check if the device is already formatted
              if ! blkid $DEVICE; then
                echo "Formatting $DEVICE..."
                mkfs.ext4 $DEVICE
              fi

              # Create the mount point
              mkdir -p $MOUNT_POINT

              # Mount the volume
              mount $DEVICE $MOUNT_POINT

              # Add to /etc/fstab for persistence
              echo "$DEVICE $MOUNT_POINT ext4 defaults,nofail 0 2" >> /etc/fstab

              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo usermod -aG docker ubuntu
              
              sudo systemctl start docker
              sudo systemctl enable docker

              sudo apt-get update
              sudo apt-get install docker-compose-plugin

              sudo apt-get install -y nginx

              systemctl start nginx
              systemctl enable nginx

              sudo apt-get remove certbot
              sudo snap install --classic certbot
              sudo ln -s /snap/bin/certbot /usr/bin/certbot
              EOF

  tags = {
    Name = var.tag
  }
}
