# VPC
resource "aws_vpc" "this" {
  id = "vpc-0ed2d31a09f17776b"
  cidr_block = var.cidr_block # CIDR
  enable_dns_support   = true   # DNS Resolution 활성화
  enable_dns_hostnames = true   # DNS Hostnames 활성화

  tags = { Name = var.name }
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id   # VPC ID

  tags = { Name = "${var.name}-igw" }
}

