
// create instance
resource "aws_instance" "tp_ec2_instance"{
    ami = data.aws_ami.ubuntu-ami.id
    instance_type = tolist(data.aws_ec2_instance_types.ami_instance.instance_types)[0]
    vpc_security_group_ids = [aws_security_group.instance_sg.id]
    key_name = aws_key_pair.maclessh.key_name
    user_data = <<-EOF
		#!/bin/bash
        sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
	EOF
  // tag of instatnce
    tags = {
        Name = "terraform-TP-Said"
    }
}
// create security groupe 
resource "aws_security_group" "instance_sg" {
    name = "terraform-test-sg-tpsaid"
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
// ssh key 
resource "aws_key_pair" "maclessh" {
    key_name = "key-said"
    public_key = var.SSH_PUB_KEY
}