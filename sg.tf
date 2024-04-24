resource "aws_security_group" "asg_sg" {
  name        = "asg-security-group"
  description = "Security group for ASG instances"
  vpc_id      = var.vpc_id  

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound traffic on port 443 for HTTPS"
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic on port 443 for HTTPS"
  }

  tags = {
    Name = "ASG Security Group"
  }
}