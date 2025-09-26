# Azure Infrastructure as Code (IaC) with Terraform

## Overview
This repository contains infrastructure-as-code (IaC) modules and CI/CD workflows designed for deploying and managing Azure resources using **Terraform** and **GitHub Actions**. The focus is on modular, reusable, and parameterized configurations that enable flexibility and automation across different environments.

## Modules Included
The repository provides Terraform modules for the following Azure resources:


- **Azure Resource Group**
- **Azure Container App**
- **Azure Container App Job**
- **Azure Container App Environment**
- **Azure Container Registry (ACR)**  
- **Azure Storage Account**  
- **Azure Key Vault**  
- **Azure Service Bus**  
- **Azure Log Analytics** 
  

## Features


- Modular Terraform codebase for provisioning various Azure resources.  
- Automated GitHub Actions workflows enabling easy, parameterized deployments and destruction of Azure infrastructure with manual triggers.  
- Secure storage of Terraform state in Azure Storage Account Blob containers.  
- Secure secrets management for sensitive data like ACR credentials via GitHub repository secrets injected into workflows.  
- Supports flexible infrastructure creation order — e.g., provisioning Log Analytics and Container App Environment before deploying container apps.  


## Getting Started


## Workflows

- All major Azure resources can be deployed, updated, and destroyed through GitHub Actions.
- Manual deployments are available using the `workflow_dispatch` trigger, letting you select parameters at runtime[1].

## Prerequisites

Before using this repository and the associated CI/CD workflows, ensure the following prerequisites are met:

- **Azure Subscription**  
  You must have access to an Azure subscription.

- **Service Principal for CI/CD Automation**  
  Create an Azure Active Directory Service Principal with sufficient permissions to manage resources, enabling secure, automated operations from CI/CD pipelines.
  
 - **Azure Storage Account for Terraform State**  
  To track the terraform resource, the storage account is required.  

  

- **GitHub Repository Secrets**  
  Configure your GitHub repository with the following secrets for authentication and resource access:

  - `AZURE_CREDENTIALS`  
    JSON output containing the Service Principal credentials (used by GitHub Actions to authenticate with Azure).

  - `AZURE_STORAGE_ACCOUNT`  
    Name of the Azure Storage Account for Terraform backend or resource state management.

  - `AZURE_STORAGE_KEY`  
    Access key for the Azure Storage Account, enabling actions like state file persistence.

  - `AZURE_SUBSCRIPTION_ID`  
    The subscription ID where Azure resources will be deployed or managed.


## Example: Deploying an Azure Container App Frontend

### Prerequisites

To deploy an Azure Container App frontend, ensure the following:

- **Azure Log Analytics Workspace**  
  Used for monitoring and troubleshooting your container app.

- **Azure Container App Environment (CAE)**  
  Provides the environment in which your container app will run.

### Terraform Backend Configuration

- The Terraform state backend is configured to use **Azure Blob Storage**, storing all state files within a single container.
- Each resource/module maintains its state in a **separate file** within this container, ensuring isolation and easier management for each resource.
   <img width="1873" height="838" alt="image" src="https://github.com/user-attachments/assets/c7e1a355-a3ce-4b0b-954b-a1ccae8a2275" />


---

### How to Proceed

You have two deployment options:

#### 1. Pre-create Dependencies
- If you already have an Azure Log Analytics workspace and CAE:
  - Deploy your container app frontend directly.
  - Supply the Log Analytics and CAE details (name and resource group) when triggering the deployment workflow.

#### 2. Create Dependencies via Workflows
- Use dedicated repository workflows to create both the Azure Log Analytics workspace and the CAE automatically.
- Run these workflows before deploying the frontend, ensuring all required infrastructure is provisioned.

---

### Recommended Workflow Sequence

1. **Run the "Deploy Azure Virtual Network, CAE & Log Analytics" Workflow**  
   (e.g., `vnet-cae-log-analytics.yml`)  
   This creates both the Log Analytics workspace and the CAE.
   <img width="1900" height="606" alt="image" src="https://github.com/user-attachments/assets/b25ff9c3-7443-4fd1-8d62-8be7766ae1a8" />



3. **Confirm resource details**  
   - Note the resource names and resource group output from the above workflow.

4. **Deploy the Frontend Container App**  
   Run the Frontend Container App deployment workflow and provide:
   <img width="1428" height="853" alt="image" src="https://github.com/user-attachments/assets/04cc274f-b509-4aea-9ee1-72ead5517cd8" />
   <img width="1876" height="850" alt="image" src="https://github.com/user-attachments/assets/28a8de1d-1a9c-4c3d-9ca3-0c2da95b807d" />






---



**Code your infrastructure, automate your success.**



