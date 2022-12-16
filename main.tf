provider "aws"{
    region = "ap-south-1"
    }

resource "aws_instance" "AWSEC2Instance"{
    ami = "ami-0f9d9a251c1a44858"
    instance_type = "t2.micro" 
    key_name = "awstest"
    security_groups = ["${aws_security_group.forapache.name}"]
    user_data = "${file("install_apache.sh")}"
    
    tags = {
        Name = "RedHat Server by Terraform - for apache"
    }
}