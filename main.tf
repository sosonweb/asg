provider "aws" {
  region = var.region  # Update with your desired region
}

module "tf_aws_userdata" {
  source = "git::ssh://github.com/sosonweb/tf_aws_userdata"
  module.tf_aws_userdata.op_userdata
}
output "op_userdata" {
  value = module.tf_aws_userdata.op_userdata
}

resource "aws_launch_configuration" "this" {
  name_prefix   = "${var.name}-"
  image_id      = var.image_id
  instance_type = var.instance_type
  user_data     = 
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                 = var.name
  launch_configuration = aws_launch_configuration.this.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = [var.subnet_id]

}
