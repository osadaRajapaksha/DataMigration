output "raw_bucket_name" {
  description = "Name of the GCS bucket for raw data"
  value       = google_storage_bucket.raw_data_lake.name
}

output "bigquery_dataset_id" {
  description = "ID of the BigQuery Dataset"
  value       = google_bigquery_dataset.analytics_dataset.dataset_id
}
