provider "aws" {
  region = "var.region"  # Update with your desired region
}

resource "aws_launch_configuration" "example" {
  name          = "var.name"
  image_id      = "var.image_id"
  instance_type = "var.intance_type"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  name                 = "var.name"
  launch_configuration = aws_launch_configuration.example.name
  min_size             = "var.min_size"
  max_size             = "var.max_size"
  desired_capacity     = "var.desired_capacity"
  vpc_zone_identifier  = ["var.subnet-id"]
}
