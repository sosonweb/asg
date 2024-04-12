
variable "region" {
  description = "The AWS region"
  type        = "us-east-1"
}

variable "image_id" {
  description = "The ID of the AMI to use for the launch configuration"
  type        = "ami-051f8a213df8bc089"
}

variable "instance_type" {
  description = "The instance type for the launch configuration"
  type        = "t2.micro"
}

variable "name" {
  description = "The name for the Auto Scaling Group"
  type        = "sos_asg"
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = 1
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = 1
}

variable "desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group"
  type        = 1
}

variable "subnet_ids" {
  description = "The IDs of the subnets where instances should be launched"
  type        = "10.0.1.0/24"
}
