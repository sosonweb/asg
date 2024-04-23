locals {
  user_data = var.user_data == null ? null : module.tf_aws_userdata.op_userdata
}