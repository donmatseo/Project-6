# PROJECT-6-DATABASE

resource "aws_db_instance" "Project-5" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "dmo"
  password             = "passdmoos"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db-subnet-grp.id
}

# DB SECURITY GROUP

resource "aws_security_group" "db-pro-6" {
  name        = "db-project-6"
  description = "Allow http inbound traffic "
  vpc_id      = aws_vpc.Project6-VPC.id

  
ingress {
    description      = "HTTP from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
     }

  tags = {
    Name = "http"
  }
}

# DATABASE SUBNET GROUP

resource "aws_db_subnet_group" "db-subnet-grp" {
  name       = "main"
  subnet_ids = [aws_subnet.Private-Subnet-1.id, aws_subnet.Private-Subnet-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}