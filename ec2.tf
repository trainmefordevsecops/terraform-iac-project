# Get the default VPC
data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

# Get all subnets in the default VPC
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Select the first subnet from the default VPC
data "aws_subnet" "selected" {
  id = data.aws_subnets.default_subnets.ids[0]
}

# Get the default security group
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_instance" "myvm" {
  ami           = "ami-0e8ebb0ab254bb563"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.selected.id
  vpc_security_group_ids = [data.aws_security_group.default.id] # Use the default security group
  key_name      = "mywebapp"
  associate_public_ip_address = true
  tags = {
    Name = "myEc2"
  }
}