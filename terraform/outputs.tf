output "raw_bucket_name" {
  description = "Name of the GCS bucket for raw data"
  value       = google_storage_bucket.raw_data_lake.name
}
