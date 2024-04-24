resource "aws_autoscaling_group" "this" {
  name                 = var.name
  launch_configuration = aws_launch_configuration.this.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = [var.subnet_id]
}

resource "aws_launch_configuration" "this" {
  name_prefix   = "${var.name}-"
  image_id      = var.image_id
  instance_type = var.instance_type
  user_data     = var.user_data
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
  security_groups      =  [aws_security_group.asg_sg.id]
  lifecycle {
    create_before_destroy = true
  }
}