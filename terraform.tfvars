# 지역 설정
region = "ap-northeast-2"

vpc_config = {
    name       = "farmmate"
    cidr_block = "192.168.0.0/16"
}

# Subnet
public_subnets = {
    "public1" = {
        cidr_block        = "192.168.1.0/24"
        availability_zone = "ap-northeast-2a"
    },
    "public2" = {
        cidr_block        = "192.168.2.0/24"
        availability_zone = "ap-northeast-2b"
    }
}
private_subnets = {
    "private1" = {
        cidr_block        = "192.168.3.0/24"
        availability_zone = "ap-northeast-2a"
    }
    "private2" = {
        cidr_block        = "192.168.4.0/24"
        availability_zone = "ap-northeast-2b"
    }
}


# NAT gateway
# 사용하지 않으면 enabled = false
nat = {
    enabled            = false
    public_subnet_name = "public1"
}

# Security Groups
# 사용하지 않으면: sg = []
sg = [
  { 
    name    = "farmmate-sg-ssh"
    ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-nat"
    ingress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-nginx"
    ingress = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 9113
        to_port     = 9113
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-jenkins"
    ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 50000
        to_port     = 50000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-spring"
    ingress = [
      {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-fastapi"
    ingress = [
      {
        from_port   = 8000
        to_port     = 8000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-prometheus"
    ingress = [
      {
        from_port   = 9090
        to_port     = 9090
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-prometheus-agent"
    ingress = [
      {
        from_port   = 9100
        to_port     = 9100
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-grafana"
    ingress = [
      {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-logstash"
    ingress = [
      {
        from_port   = 5044
        to_port     = 5044
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 9600
        to_port     = 9600
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-elasticsearch"
    ingress = [
      {
        from_port   = 9200
        to_port     = 9200
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-kibana"
    ingress = [
      {
        from_port   = 5601
        to_port     = 5601
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-filebeat"
    ingress = [
      {
        from_port   = 5044
        to_port     = 5044
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-ngrinder"
    ingress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  { 
    name    = "farmmate-sg-redis"
    ingress = [
      {
        from_port   = 6379
        to_port     = 6379
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
]

# EC2
# 사용하지 않으면: intances = []
instances = [
  {
    name                 = "nat"
    ami                  = "ami-0c2d3e23e757b5d84" # Amazon Linux NAT AMI
    instance_type        = "t3.nano"
    volume               = 10
    is_public            = true
    subnet_name          = "public1"
    security_group_names = ["farmmate-sg-nat"]
  },
  {
    name                 = "nginx_cloud"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 10
    is_public            = true
    subnet_name          = "public1"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-nginx", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "nginx_service"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 20
    is_public            = true
    subnet_name          = "public2"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-nginx", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "nginx_service_ai"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 10
    is_public            = true
    subnet_name          = "public2"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-nginx", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "jenkins"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 20
    is_public            = false
    subnet_name          = "private1"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-jenkins", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "jenkins-scaleup"
    ami                  = "ami-02012f450a9046624" # Jenkins custom AMI
    instance_type        = "t3.small"
    volume               = 20
    is_public            = false
    subnet_name          = "private1"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-jenkins", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "api2-scaleup"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.small"
    volume               = 20
    is_public            = false
    subnet_name          = "private2"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-spring", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "api-scaleup"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.small"
    volume               = 20
    is_public            = false
    subnet_name          = "private2"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-spring", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "ai"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 20
    is_public            = false
    subnet_name          = "private2"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-fastapi", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "ai2"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 20
    is_public            = false
    subnet_name          = "private2"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-fastapi", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "redis"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.small"
    volume               = 14
    is_public            = false
    subnet_name          = "private2"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-redis", "farmmate-sg-prometheus-agent"]
  },
  {
    name                 = "prometheus"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.small"
    volume               = 20
    is_public            = false
    subnet_name          = "private1"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-prometheus"]
  },
  {
    name                 = "grafana"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 20
    is_public            = false
    subnet_name          = "private1"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-grafana", "farmmate-sg-prometheus-agent"]
  },
  # {
  #   name                 = "logstash"
  #   ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
  #   instance_type        = "t3.small"
  #   volume               = 20
  #   is_public            = false
  #   subnet_name          = "private1"
  #   security_group_names = ["farmmate-sg-ssh", "farmmate-sg-logstash", "farmmate-sg-prometheus-agent"]
  # },
  # {
  #   name                 = "elasticSearch"
  #   ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
  #   instance_type        = "t3.small"
  #   volume               = 50
  #   is_public            = false
  #   subnet_name          = "private1"
  #   security_group_names = ["farmmate-sg-ssh", "farmmate-sg-elasticsearch", "farmmate-sg-prometheus-agent"]
  # },
  # {
  #   name                 = "kibana"
  #   ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
  #   instance_type        = "t3.micro"
  #   volume               = 20
  #   is_public            = false
  #   subnet_name          = "private1"
  #   security_group_names = ["farmmate-sg-ssh", "farmmate-sg-kibana", "farmmate-sg-prometheus-agent"]
  # },
  {
    name                 = "loadtest-ngrinder"
    ami                  = "ami-0f1e61a80c7ab943e" # Amazon Linux 2023
    instance_type        = "t3.micro"
    volume               = 20
    is_public            = false
    subnet_name          = "private1"
    security_group_names = ["farmmate-sg-ssh", "farmmate-sg-spring", "farmmate-sg-prometheus-agent", "farmmate-sg-ngrinder"]
  },
]

# RDS 
# 사용하지 않으면: is_rds = false
is_rds = true

rds_sg = [ 
  { 
    name    = "farmmate-sg-rds-mysql"
    ingress = [
      {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
]

rds_config = {
  rds_name              = "service"
  allocated_storage     = 20
  max_allocated_storage = 100
  db_name               = "FARMMATE"
  engine                = "mysql"
  engine_version        = "8.0.34"
  instance_class        = "db.t4g.micro"
  username              = "root"
  password              = "1q2w3e4r!"
  security_group_names  = ["farmmate-sg-rds-mysql"]
  skip_final_snapshot   = true
}


# ECR 
# 사용하지 않으면: ecr_repositories = []
ecr_repositories = [
  {
    name                   = "farmmate-api"
    image_tag_mutability   = "MUTABLE"
    image_scanning_enabled = false
    lifecycle_policy       = false 
    tags = {
      type = "CI/CD"
    }
  },
  {
    name                   = "farmmate-ai"
    image_tag_mutability   = "MUTABLE"
    image_scanning_enabled = false
    lifecycle_policy       = true
    tags = {
      type = "CI/CD"
    }
  }
]

# S3
# 사용하지 않으면: s3_buckets = {} 
s3_buckets = {
  "farmmate-terraform-outputs" = {
    bucket_name             = "farmmate-terraform"
    enable_website_hosting  = false          # Outputs 데이터를 웹에서 노출할 필요 없음
    enable_cors             = false          # 브라우저 기반 접근 불필요
    enable_public_access    = false          # 공개 접근 차단
    block_public_acls       = true           # 모든 Public ACL 차단
    ignore_public_acls      = true           # Public ACL 무시
    block_public_policy     = true           # Public 정책 차단
    restrict_public_buckets = true           # 모든 Public 접근 차단
    environment             = "production"
  },
  # "bucket2" = {
  #   bucket_name             = "terraform-farmmate-my-example-bucket-2"
  #   enable_website_hosting  = false
  #   enable_cors             = false
  #   enable_public_access    = false
  #   block_public_acls       = true
  #   ignore_public_acls      = true
  #   block_public_policy     = true
  #   restrict_public_buckets = true
  #   environment             = "development"
  # }
}

