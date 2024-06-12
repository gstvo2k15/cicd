provider "aws" {
  region     = var.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.app_server.public_ip} > ip_address.txt"
  }

  tags = {
    Name = "AppServer"
  }
}

output "instance_ip" {
  value = aws_instance.app_server.public_ip
}
