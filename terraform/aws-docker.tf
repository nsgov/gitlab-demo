provider "aws" {
    access_key = "ACCESS_KEY"
    secret_key = "SECRET_KEY"
    region = "us-east-2"
}

resource "aws_instance" "docker" {
  ami = "ami-10547475"
  instance_type = "t2.medium"
  key_name = "terraform-key"
  security_groups = ["${aws_security_group.docker.name}"]

  tags {
      Name = "docker"
  }

  connection {
    user = "ubuntu"
    private_key = "${file("${path.module}/keys/id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -Ls https://get.cloud.docker.com/ | sudo -H sh -s DOCKER_CLOUD_KEY",
    ]
  }

  depends_on = [ "aws_key_pair.deployer", "aws_security_group.docker" ]
}

resource "aws_security_group" "docker" {
  name = "jumphost_rules"
  description = "Allow inbound traffic"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
      from_port = 2222 
      to_port = 2222
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "terraform-key" 
  public_key = "${file("${path.module}/keys/id_rsa.pub")}"
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.docker.id}"
    depends_on = ["aws_instance.docker"]
}

output "ip" {
    value = "${aws_eip.ip.public_ip}"
}
