resource "aws_instance" "my-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.ZONES["zone1"]
  vpc_security_group_ids = [var.SECURITY_GROUP_ID]
  tags                   = var.TAGS
}
