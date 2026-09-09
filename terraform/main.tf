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
