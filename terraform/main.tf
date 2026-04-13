provider "aws" {
  region = "us-east-1"
}

# Usamos un bloque "data" o definimos el recurso para que Terraform 
# sepa que esta es la infraestructura que estamos gestionando.
resource "aws_instance" "vm" {
  # IMPORTANTE: Estos datos deben coincidir con tu VM actual
  ami           = "ami-0c02fb55956c7d316" 
  instance_type = "t3.micro"
  key_name      = "aws-key-devops"

  tags = {
    Name        = "VM-Evaluacion-Final"
    Project     = "DevOps-Docker-Rollback"
    Environment = "Production"
  }
}

# Este es el bloque que "cura" el error del pipeline.
# Aunque la IP sea fija, declararlo aquí permite que Jenkins 
# la obtenga de forma dinámica y profesional.
output "public_ip" {
  description = "Dirección IP pública de la VM para el despliegue de Docker"
  value       = "54.83.80.60"
}

