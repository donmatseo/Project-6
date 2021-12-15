variable "Vpc_cidr" {
  description = "name of Vpc cidr block"
  default     = "10.0.0.0/16"
}

variable "Public-Subnet-1-cidr" {
  description = "name of public subnet 1 cidr block"
  default     = "10.0.20.0/24"
}

variable "Public-Subnet-2-cidr" {
  description = "name of public subnet 2 cidr block"
  default     = "10.0.21.0/24"
}

variable "Private-Subnet-1-cidr" {
  description = "name of private subnet 1 cidr block"
  default     = "10.0.22.0/24"
}

variable "Private-Subnet-2-cidr" {
  description = "name of private subnet 2 cidr block"
  default     = "10.0.23.0/24"
}

variable "region" {
  description = "name of region"
  default = "eu-west-1"
}