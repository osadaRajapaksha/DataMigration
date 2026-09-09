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
2. Set your Project ID in `terraform/variables.tf` (or provide it via a `terraform.tfvars` file).
3. Initialize and apply Terraform:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

## 2. Upload Sample Data
Once the infrastructure is created, Terraform will output the `raw_bucket_name`. Upload the sample data into it:
```bash
gsutil cp ../data/sample_data.csv gs://<YOUR_RAW_BUCKET_NAME>/incoming/
```

## 3. Data Fusion Pipeline
1. Navigate to the Cloud Data Fusion UI in the GCP Console.
2. Click **Studio**.
3. Build a pipeline (Source: GCS, Transform: Wrangler, Sink: BigQuery).
4. Deploy and Run the pipeline.
