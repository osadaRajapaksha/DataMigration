# Cloud Storage Bucket - Raw Landing Zone
resource "google_storage_bucket" "raw_data_lake" {
  name          = "${var.project_id}-raw-data-${var.environment}"
  location      = var.region
  force_destroy = true
}
