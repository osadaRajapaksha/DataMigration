# Cloud Storage Bucket - Raw Landing Zone
resource "google_storage_bucket" "raw_data_lake" {
  name          = "${var.project_id}-raw-data-${var.environment}"
  location      = var.region
  force_destroy = true
}

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }

# BigQuery Dataset - Analytics Zone
resource "google_bigquery_dataset" "analytics_dataset" {
  dataset_id                  = "enterprise_analytics_${var.environment}"
  friendly_name               = "Enterprise Analytics"
  description                 = "Dataset for enterprise customer analytics"
  location                    = var.region
  delete_contents_on_destroy  = true
}

# Dedicated Service Account for Data Fusion
resource "google_service_account" "data_fusion_sa" {
  account_id   = "data-fusion-runner-${var.environment}"
  display_name = "Data Fusion Runner Service Account"
}

# Grant BigQuery Access to Data Fusion SA
resource "google_project_iam_member" "data_fusion_bq" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.data_fusion_sa.email}"
}

# Grant Cloud Storage Access to Data Fusion SA
resource "google_project_iam_member" "data_fusion_gcs" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.data_fusion_sa.email}"
}

# Cloud Data Fusion Instance
resource "google_data_fusion_instance" "etl_instance" {
  name    = "enterprise-etl-${var.environment}"
  region  = var.region
  type    = "BASIC"
}
