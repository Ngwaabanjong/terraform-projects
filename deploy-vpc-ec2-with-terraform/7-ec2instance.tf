resource "aws_instance" "MyServer" {
  ami                         = "ami-0ff8a91507f77f867"
  instance_type               = "t2.micro"
  key_name                    = "bjuatkey"
  monitoring                  = true
  subnet_id                   = aws_subnet.public2.id
  vpc_security_group_ids      = [aws_security_group.MySg.id]
  associate_public_ip_address = true

  //CODE//
# for_each = toset(["node-1", "node-2"])
#    tags = {
#      Name = "${each.key}-${var.project-name}-ec2"
#    }

  tags = {
    Name = "${var.project-name}-ec2"
  }
}





