# Enterprise Data Migration & Analytics Modernization

This repository contains the infrastructure-as-code (Terraform) and supporting scripts to build an end-to-end data pipeline on Google Cloud Platform.

## Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (v1.0+)
- Google Cloud CLI (`gcloud`) installed and authenticated.
- A GCP Project with billing enabled.

## 1. Setup Infrastructure
1. Authenticate with GCP:
   ```bash
   gcloud auth application-default login
   ```
