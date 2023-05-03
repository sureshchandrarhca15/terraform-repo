resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "tf-bucket" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  project       = var.gcp_project_id
  location      = var.gcp_region
  force_destroy = "false" 
  storage_class = var.storage-class
  versioning {
    enabled = true
  }
}
