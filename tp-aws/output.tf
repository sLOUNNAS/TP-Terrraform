output "adresse_ip_instance" {
  value = aws_instance.tp_ec2_instance.public_ip
}
