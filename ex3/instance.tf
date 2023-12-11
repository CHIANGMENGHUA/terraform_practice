resource "aws_key_pair" "terra-key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

resource "aws_instance" "terra-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.ZONES["zone1"]
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = [var.SECURITY_GROUP_ID]
  tags                   = var.TAGS

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terra-key")
    host        = self.public_ip
  }
}
