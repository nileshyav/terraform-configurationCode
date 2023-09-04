terraform {
  backend "s3" {
    bucket = "statefilebucket123"
    key    = "key"
    region = "us-east-1"
    dynamodb_table = "nilesh-lock"
    # encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# resource "aws_ebs_volume" "nileshEbs" {
#   availability_zone = "us-east-1a"
#   size              = 8
#   count = length(var.ebsNames)
#   tags = {
#     Name = "EBS ${count.index}"
#   }

#   lifecycle {
#     create_before_destroy = true

#   }
# }

resource "aws_ebs_volume" "nileshEbs" {
  availability_zone = "us-east-1a"
  size      = 8
  for_each = var.ebsNames
  tags = {
    Name = each.key
  }

  
}

output "ebsId" {
  value = { for k, v in aws_ebs_volume.nileshEbs : k => v.id }
  description = "Id of Ebs Created"
}

# output "ebsArn" {
#   value = aws_ebs_volume.nileshEbs.*.arn
#   description = "arn of Ebs Created"
# }


