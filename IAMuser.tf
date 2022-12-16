provider "aws"{
    region = "ap-south-1"
    }

resource "aws_iam_user" "IAMUser"{
    //name = "saicherry"
     count = length(var.iam_users)
      name = var.iam_users[count.index]  
         
  }