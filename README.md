# IaC_AZURE_1_1: Azure Virtual Network Peering with Terraform

[![Terraform](https://img.shields.io/badge/Terraform-1.9+-7B42BC?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-0078D4?logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Pet project demonstrating Azure Networking (AZ-700) and Infrastructure as Code (Terraform Associate 004) skills.**

This project creates two Virtual Networks (VNets) in a single Resource Group with bidirectional peering and one subnet in each VNet.  
Clean, production-ready infrastructure built with Terraform best practices.

### Architecture

```mermaid
graph TD
    subgraph "Resource Group: rg-iac-azure-1-1"
        VNet1[VNet1<br>10.0.0.0/16<br>East US]
        VNet2[VNet2<br>10.1.0.0/16<br>East US]
        
        subgraph "VNet1"
            Subnet1[Subnet1<br>10.0.1.0/24]
        end
        
        subgraph "VNet2"
            Subnet2[Subnet2<br>10.1.1.0/24]
        end
        
        Peering12[Peering VNet1 ↔ VNet2<br>Bidirectional]
    end

    style VNet1 fill:#0078D4,color:#fff
    style VNet2 fill:#0078D4,color:#fff
```
![Resource Group Overview](screenshots/01-vnets.png.png)
**Resource Group со всеми созданными ресурсами**

![Virtual Networks](screenshots/02-subnet.png)
**Две Virtual Network и подсети**

![VNet Peering](screenshots/03-peeringpng.png)
**Bidirectional VNet Peering (статус Connected)**
--

Proof of Deployment (Screenshots from Azure Portal)
<img src="screenshots/01-vnets.png.png" alt="Resource Group Overview">
Created resources
<img src="screenshots/02-subnet.png" alt="Virtual Networks">
The first subnet
<img src="screenshots/03-peeringpng.png" alt="VNet Peering">
Bidirectional VNet Peering (status: Connected)