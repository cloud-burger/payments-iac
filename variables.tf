variable "database_instance_class" {
  default = "db.t3.micro"
}

variable "database_name" {
  default = "payment"
}

variable "database_username" {
  default = "postgres"
}

variable "database_password" {
  default = ""
}

variable "project" {
  default = "cloud-burger"
}

variable "environment" {
  default = "dev"
}