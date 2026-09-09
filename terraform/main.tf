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
