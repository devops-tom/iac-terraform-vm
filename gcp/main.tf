// Configure the Google Cloud provider
provider "google" {
 credentials = var.credentials
 project     = var.project
 region      = var.location
}

