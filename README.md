AWS Terraform DevOps Project 

Project Overview

This project demonstrates the design, provisioning, automation, and monitoring of cloud infrastructure on AWS using DevOps best practices.

The infrastructure is fully defined as code using Terraform, automatically deployed via GitHub Actions CI/CD, and monitored in real time using a complete Prometheus + Grafana observability stack.

⸻

Architecture

The deployed infrastructure includes:
	•	Custom VPC network
	•	Public & Private Subnets
	•	Internet Gateway & Route Tables
	•	Security Groups
	•	EC2 Ubuntu Instance
	•	NGINX Web Server
	•	Monitoring stack:
	•	Node Exporter
	•	Prometheus
	•	Grafana

All resources are provisioned automatically through Terraform.

⸻

Infrastructure as Code (Terraform)

Key components defined:
	•	aws_vpc – custom CIDR network
	•	aws_subnet – public & private segmentation
	•	aws_internet_gateway
	•	aws_route_table + associations
	•	aws_security_group
	•	aws_key_pair
	•	aws_instance (Ubuntu t2.micro)

Terraform state is stored remotely using:
	•	S3 Backend → remote state storage
	•	DynamoDB → state locking

This prevents duplicate infrastructure creation and enables CI/CD collaboration.

⸻

CI/CD Pipeline (GitHub Actions)

Infrastructure changes are automatically deployed via GitHub Actions.

Trigger

Pipeline runs on push events affecting .tf files.

Workflow Steps
	1.	Checkout repository
	2.	Install Terraform
	3.	Configure AWS credentials
	4.	Terraform init (S3 backend)
	5.	Terraform plan
	6.	Terraform apply

This ensures infrastructure is always synchronized with repository code.

⸻

Web Server

An Ubuntu EC2 instance hosts:
	•	NGINX
	•	Custom HTML/CSS static website

Accessible via the instance public IP.

⸻

Monitoring Stack

Node Exporter
	•	Collects OS-level metrics:
	•	CPU
	•	Memory
	•	Disk
	•	Network
	•	Load

Runs as a systemd service on port 9100.

⸻

Prometheus
	•	Scrapes metrics from Node Exporter
	•	Stores time-series monitoring data
	•	Accessible on port 9090

Configured target:

localhost:9100


⸻

Grafana
	•	Visualizes Prometheus metrics
	•	Runs on port 3000
	•	Connected via Prometheus data source

Imported dashboard:
	•	Node Exporter Full (ID: 1860)

Provides real-time visualization of system performance.

⸻

Security

Security Group rules include:
	•	SSH (22) → restricted to personal IP
	•	HTTP (80) → public
	•	Grafana (3000) → restricted/public (demo)
	•	Prometheus (9090) → restricted/public
	•	Node Exporter (9100) → restricted to personal IP

⸻

Repository Structure

.
├── Terraform/
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── backend.tf
│   └── keys/
├── .github/
│   └── workflows/
│       └── terraform.yml
├── secrets/ (ignored)
└── README.md


⸻

How to Deploy

1. Clone repository

git clone https://github.com/<your-username>/aws-terraform-devops.git
cd aws-terraform-devops/Terraform

2. Initialize Terraform

terraform init

3️. Plan

terraform plan -var="my_ip_cidr=YOUR_IP/32"

4️. Apply

terraform apply -auto-approve -var="my_ip_cidr=YOUR_IP/32"


⸻

Access Points

Service	URL
Website	http://EC2_PUBLIC_IP
Prometheus	http://EC2_PUBLIC_IP:9090
Grafana	http://EC2_PUBLIC_IP:3000
Node Exporter	http://EC2_PUBLIC_IP:9100/metrics


⸻


Future Improvements
	•	Auto-installation via Terraform user_data
	•	Alerting (CPU/RAM thresholds)
	•	Load Balancer + Auto Scaling
	•	Multi-environment deployments
	•	Ansible provisioning

⸻

Author

Ilie Ioan-Călin
Systems Engineering Student – Politehnica University of Bucharest
DevOps • Cloud • Automation • Optimization

⸻

License

This project is for educational and portfolio purposes.
