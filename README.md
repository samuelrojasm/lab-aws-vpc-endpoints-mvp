# 🧪 Lab Personal: MVP de creación de VPC Endpoints

[![AWS](https://img.shields.io/badge/AWS-%23FF9900?logo=amazonaws&logoColor=white)](#)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)](#)
[![HCL](https://img.shields.io/badge/Language-HCL-blueviolet)](#)
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

## 🚀 Demostración y prueba del laboratorio
### Terraform Apply
 <p align="center">
    <img src="assets/tf-apply.png" alt="tf-apply" width="90%">
</p>

### Terraform state list
<p align="center">
    <img src="assets/tf-state-list.png" alt="tf-state-list" width="80%">
</p>

### Vista de Endpoints en la consola de AWS
<p align="center">
    <img src="assets/aws-console.png" alt="aws-console" width="90%">
</p>

### VPC Resource Map
<p align="center">
    <img src="assets/vpc-resource-map.png" alt="vpc-resource-map" width="90%">
</p>

### Terraform Destroy
<p align="center">
    <img src="assets/tf-destroy.png" alt="tf-destroy" width="70%">
</p>

---

## 🔗 Referencias
- []()

---

### 📝 Licencia

Este repositorio está disponible bajo la licencia MIT.
Puedes usar, modificar y compartir libremente el contenido, incluso con fines comerciales.
Consulta el archivo [`LICENSE`](./LICENSE) para más detalles.

---
