# vpc.tf

# ----------------------------------------------------
# Obtener información de las Availability Zones
# ----------------------------------------------------
# Algunas zonas de disponibilidad más nuevas requieren
# que explícitamente suscripción a ellas antes de poder usarlas.
# Este filtro asegura que solo obtengas las zonas que están disponibles automáticamente para la cuenta.
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# ----------------------------------------------------
# VPC Module
# ----------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 2) # Obtiene 2 zonas de disponibilidad (AZs)
  private_subnets = var.private_subnet_cidrs

  # ----------------------------------------------------
  # Acceso público (si var.enable_public_access=true)
  # ----------------------------------------------------
  public_subnets     = var.enable_public_access ? var.public_subnet_cidrs : []
  enable_nat_gateway = var.enable_public_access
  single_nat_gateway = var.enable_public_access

  enable_dns_hostnames = false
  enable_dns_support   = false
}