# 🧪 Lab Personal: MVP de creación de VPC Endpoints

[![AWS](https://img.shields.io/badge/AWS-%23FF9900?logo=amazonaws&logoColor=white)](#)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?logo=amazon-web-services&logoColor=white)](#)

[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)](#)
[![HCL](https://img.shields.io/badge/Language-HCL-blueviolet)](#)

[![Python](https://img.shields.io/badge/Language-Python-3776AB?logo=python&logoColor=white)](#)

[![Docker](https://badgen.net/badge/icon/docker?icon=docker&label)](#)

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)


> Este repositorio contiene un **laboratorio mínimo funcional (MVP)** para crear VPC Endpoints en AWS utilizando Terraform. Es un ejemplo básico para comenzar con el acceso privado a servicios de AWS desde una VPC.  


## 🎯 Objetivos del MPV
- Proveer una configuración mínima y funcional con Terraform para desplegar VPC Endpoints en AWS, sirviendo como punto de partida para aprender, validar conectividad privada y construir laboratorios más avanzados de red y seguridad.

---

## ⚙ Tecnolgías usadas
- La arquitectura desplegada es:
    - **VPC** con subnets privadas en múltiples Zonas de Disponibilidad.  
    - **VPC Endpoints** (Interface/Gateway) para servicios principales de AWS (ej. EKS, S3, SSM).  
    - **Security Groups** con reglas mínimas de acceso a los endpoints.  

## ⚙ Este MVP del workflow de VPC Endpoints incluye solo lo esencial
- Crea una VPC con subnets privadas.
- Implementa endpoints básicos (ej. EKS, S3, SSM).
- Reglas de seguridad mínimas.
- Outputs de Terraform listos para usar.

---

## 🚀 Demostración y Prueba del laboratorio (el MVP Funcional)
- Sección 01
    ```bash
    open -a Docker
    ```

    ```hcl
        resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
            role       = aws_iam_role.lambda_role.name
            policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
        }
    ```

    ```json
    {"message":"Hola Samuel desde Lambda con HTTP API!"}
    ```

    <p align="center">
        <img src="imagenes/imagen.png" alt="imagen" width="80%">
    </p>

> [!NOTE]
> Este es un bloque de nota.

---

## 🔗 Referencias
- []()

---

### 📝 Licencia

Este repositorio está disponible bajo la licencia MIT.
Puedes usar, modificar y compartir libremente el contenido, incluso con fines comerciales.
Consulta el archivo [`LICENSE`](./LICENSE) para más detalles.

---
