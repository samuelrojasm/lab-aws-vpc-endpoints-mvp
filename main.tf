# main.terraform {

# --------------------------------------------------------------------------------------
# Creacion de VPC Endpoints de EKS
#   - Crea VPC Endpoints de tipo Interface en AWS dentro de la VPC
#   - Para clústeres EKS privados 100% funcionales, sin necesidad de NAT Gateway
#   - Los endpoints de tipo Interface crean ENIs dentro de subredes
# --------------------------------------------------------------------------------------


resource "aws_vpc_endpoint" "eks" {
  # Crea un endpoint privado para la API del cluster de EKS dentro de las subredes privadas de la VPC
  vpc_id              = module.vpc.vpc_id
  service_name        = "eks"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = module.vpc.private_subnets
  security_group_ids  = [module.vpc_endpoints_sg.security_group_id]
  private_dns_enabled = true
  tags = {
    Name = "EKS-AUTH-Endpoint"
  }
}

# --------------------------------------------------------------------------------------
# Módulo VPC para crear los endpoints
#   - Crea VPC Endpoints de tipo Interface en AWS dentro de la VPC
#   - Para clústeres EKS privados 100% funcionales, sin necesidad de NAT Gateway
#   - Los endpoints de tipo Interface crean ENIs dentro de subredes
# --------------------------------------------------------------------------------------
module "vpc_endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "~> 6.0"

  # ID de la VPC donde se crearán los endpoints
  vpc_id = module.vpc.vpc_id

  # ID de los grupos de seguridad que se asociarán a los endpoints
  # Es recomendable tener un grupo de seguridad específico para los endpoints
  security_group_ids = [module.vpc_endpoints_sg.security_group_id]

  # Lista de IDs de las subredes privadas donde se crearán los endpoints
  # Esto es crucial para los endpoints de tipo "Interface"
  subnet_ids = module.vpc.private_subnets

  # ---------------------------------------------------------------------------------------
  # endpoints
  # - Cada entrada crea un VPC Endpoint de tipo Interface apuntando a un servicio de AWS
  # - Para la definición de los endpoints, se usa un mapa para crear múltiples endpoints
  # - Habilita la resolución de DNS privada para que los servicios de AWS sean accesibles desde la VPC sin salir a Internet
  # - Permite que los servicios de AWS (EKS, EC2, CloudWatch, SSM, KMS, ELB, etc.) sean accesibles de manera privada desde la VPC
  # - Evita la necesidad de un NAT Gateway para salir a Internet
  # - Mejora la seguridad y reduce costos de transferencia de datos

  endpoints = {

    eks_auth = {
      service             = "com.amazonaws.${var.aws_region}.eks-auth"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "EKS-AUTH-Endpoint"
      }
    },


    # Endpoint para EKS STS (para tokens IAM)
    # Habilitar un endpoint privado para STS permite que los nodos de tu VPC obtengan tokens IAM sin salir a Internet, muy útil para clusters EKS privados.
    sts = {
      service             = "sts"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags                = { Name = "STS-Endpoint" }
    },

    # Endpoint para EC2 (necesario si los nodos necesitan metadata/SSM)
    ec2 = {
      service             = "ec2"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "EC2-Endpoint"
      }
    },

    elasticloadbalancing = {
      service             = "elasticloadbalancing"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "ELB-Endpoint"
      }
    },

    ssm = {
      service             = "ssm"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "SSM-Endpoint"
      }
    },

    ssmmessages = {
      service             = "ssmmessages"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "SSM-Messages-Endpoint"
      }
    },

    ec2messages = {
      service             = "ec2messages"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "EC2-Messages-Endpoint"
      }
    },

    # Endpoint para CloudWatch Logs
    logs = {
      service             = "logs"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "CloudWatch-Logs-Endpoint"
      }
    },

    cloudwatch = {
      service             = "monitoring"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "CloudWatch-Metrics-Endpoint"
      }
    },

    kms = {
      service             = "kms"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags = {
        Name = "KMS-Endpoint"
      }
    },

    # Endpoint para ECR (si usamos imágenes privadas)
    ecr_api = {
      service             = "ecr.api"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags                = { Name = "ECR-API-Endpoint" }
    },

    ecr_dkr = {
      service             = "ecr.dkr"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = true
      tags                = { Name = "ECR-DKR-Endpoint" }
    },

    # Gateway endpoints
    # Endpoint para S3 (Gateway endpoint)
    s3 = {
      service           = "s3"
      vpc_endpoint_type = "Gateway"
      tags              = { Name = "S3-Endpoint" }
    }
  }
}
