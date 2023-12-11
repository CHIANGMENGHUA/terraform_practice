resource "aws_key_pair" "terra-key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

resource "aws_instance" "vpro-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTANCE_TYPE
  subnet_id              = aws_subnet.vpro-pub-1.id
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = [aws_security_group.vpro-sg.id]
  tags = {
    Name    = "vpro-inst"
    Project = "vpro-p"
  }

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

resource "aws_ebs_volume" "vpro-volume-1" {
  availability_zone = var.ZONES["zone1"]
  size              = 3
  tags = {
    Name = "vpro-volume-1"
  }
}

resource "aws_volume_attachment" "vpro-volume-attachment-1" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vpro-volume-1.id
  instance_id = aws_instance.vpro-inst.id
}

output "PublicIP" {
  value = aws_instance.vpro-inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.vpro-inst.private_ip
}
