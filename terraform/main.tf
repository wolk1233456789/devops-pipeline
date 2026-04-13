
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vm" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  key_name      = "aws-key-devops"

  tags = {
    Name = "Jenkins-VM"
  }
}

# ESTA ES LA PARTE QUE FALTA Y ES CRÍTICA
output "public_ip" {
  description = "IP pública de la instancia creada"
  value       = aws_instance.vm.public_ip
}
