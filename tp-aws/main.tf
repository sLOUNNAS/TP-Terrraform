data "aws_ami" "ubuntu-ami"{
    owners = ["099720109477"]
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20200408"]
    }
}
data "aws_ec2_instance_types" "ami_instance" {
    filter {
      name = "processor-info.supported-architecture"
      values = [data.aws_ami.ubuntu-ami.architecture]
    }
}
module "app_s3_bucket" {
    source = "./modules/aws-s3-static-app-bucket"
}