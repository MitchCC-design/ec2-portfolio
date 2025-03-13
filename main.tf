provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}

# Security Group to Allow HTTP & SSH Access
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-portfolio-sg"
  description = "Allow HTTP and SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH access from anywhere (optional)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows HTTP access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance with User Data Script
resource "aws_instance" "ec2_portfolio" {
  ami             = "ami-04aa00acb1165b32a"
  instance_type   = "t2.micro"
  key_name        = "Mt" 
  security_groups = [aws_security_group.ec2_sg.name]

  user_data = file("user-data.sh") # Automatically injects your User Data script

  tags = {
    Name = "EC2-Portfolio"
  }
}

# Output the Public IP Address
output "website_ip" {
  value = aws_instance.ec2_portfolio.public_ip
  description = "Public IP Address of the EC2 instance"
}
