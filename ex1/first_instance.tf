# Parse JSON from File
locals {
  json_data = jsondecode(file("../.json"))
}

# Accessing Properties from Decoded JSON File
provider "aws" {
  region = local.json_data.region
}

resource "aws_instance" "intro" {
  ami                    = local.json_data.ami
  instance_type          = local.json_data.instance_type
  availability_zone      = local.json_data.availability_zone
  key_name               = local.json_data.key_name
  vpc_security_group_ids = [local.json_data.vpc_security_group_ids]
  tags = {
    Name    = local.json_data.instance_name
    Project = local.json_data.project
  }
}
