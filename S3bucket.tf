provider "aws"{
    region = "ap-south-1"
    }

resource "aws_s3_bucket" "s3bucketsai"{
    bucket = "s3bucketsaisimple"
    acl = "private"
    versioning {
        enabled = true
    }
    tags = {
        name = "s3 bucket by sai"
    }
}   