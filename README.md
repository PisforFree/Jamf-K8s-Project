# Jamf Kubernetes Project

## Overview

This project demonstrates how to deploy a simple web application using Kubernetes on AWS.

The goal was to build a reliable system that:
- stays available during failures
- handles updates without downtime
- can scale when needed

This project uses:
- Amazon EKS for Kubernetes
- Terraform for infrastructure
- Kubernetes YAML files for deployment
- Docker for containerization

This setup reflects how modern cloud applications are built and managed.

---

## Project Objective

The main objective was to simulate a real-world scenario where a company wants to:

- reduce service outages
- avoid downtime during updates
- improve performance under load
- recover automatically from failures

This project shows how Kubernetes helps solve these problems. :contentReference[oaicite:0]{index=0}

---

## Technology Used

- AWS EKS (Kubernetes cluster)
- Terraform (infrastructure as code)
- Docker (container platform)
- Kubernetes (container orchestration)
- Ghost CMS (web application)
- MySQL (database)

---

## Project Phases

### Phase 1: Project Setup
- Created a clean folder structure
- Separated infrastructure, application, and documentation

### Phase 2: Infrastructure Deployment
- Used Terraform to build AWS resources:
  - VPC (existing)
  - Public and private subnets
  - Internet Gateway and NAT Gateway
  - Route tables
  - Security groups
- Created EKS cluster
- Created managed node group
- Verified cluster and nodes were active

### Phase 3: Application Preparation
- Used Docker Compose to run:
  - Ghost (frontend)
  - MySQL (database)
- Verified the application worked locally
- Learned how services communicate inside containers

### Phase 4: Kubernetes Deployment
- Created Kubernetes YAML files:
  - Deployment
  - Service
- Deployed the application using:
  kubectl apply -f k8s/

---

## Major Issue and Troubleshooting

### Problem
The application could not be accessed through the LoadBalancer.

### Root Cause
- Incorrect container port configuration
- Service and Deployment ports did not match

### How It Was Fixed
- Updated containerPort in the Deployment
- Updated targetPort in the Service

### Verification Steps
- Checked services:
  kubectl get svc
- Checked endpoints:
  kubectl get endpoints
- Tested internal access:
  wget <pod-ip>:2368

After fixing the issue:
- The application became accessible through the LoadBalancer
- The app loaded successfully in the browser

---

## Key Concepts Learned

### Kubernetes
- Pods and Deployments
- Services (ClusterIP and LoadBalancer)
- Internal vs external communication
- Debugging with endpoints

### AWS
- EKS cluster setup
- Load Balancer behavior
- Security group impact on traffic

### DevOps
- Infrastructure as Code with Terraform
- GitHub repository organization
- Cost control by destroying resources when not in use

---

## High Availability Features

This project included several features to improve reliability:

- Multiple Pods for redundancy
- Rolling updates to avoid downtime
- Health checks to detect failures
- Load balancing to distribute traffic
- Autoscaling to handle traffic changes :contentReference[oaicite:1]{index=1}

---

## Project Outcome

At the end of the project, the application was able to:

- run inside Kubernetes
- be accessed from a browser
- recover from configuration issues
- demonstrate real-world troubleshooting

---

## Cleanup (Cost Control)

To avoid AWS charges, all resources were removed:

- Kubernetes resources deleted
- LoadBalancer removed
- EKS cluster destroyed
- Terraform destroy completed

---

## What Could Be Improved

For a production environment, the following could be added:

- HTTPS with a custom domain
- CI/CD pipeline for automation
- monitoring and alerting
- backup and disaster recovery
- stronger security practices

---

## Final Thoughts

This project shows how a simple application can be deployed in a modern cloud environment.

It demonstrates:
- how infrastructure is created
- how applications are deployed
- how problems are diagnosed and fixed

This is a strong example of real-world DevOps and Kubernetes skills.
