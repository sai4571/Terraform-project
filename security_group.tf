resource "aws_security_group" "forapache"{
    description = "allow http inbound traffic"
    name = "allow_http"
    vpc_id = "vpc-0de6d5796a5006b93"
    
    ingress {
        description = "InBound Rules enable"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
        egress {
        description = "OutBound Rules enable"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    lifecycle {
      create_before_destroy = "true"
    }
}

