provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vm" {

  ami  = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  count = length(var.vmName)
    # for_each = var.vmName
  tags = {
    Name = var.vmName[count.index]
    # Name = each.value
  }

  user_data = <<-EOF
                apt update -y

                  EOF

}

