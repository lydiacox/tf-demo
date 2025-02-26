terraform {
  backend "gcs" {
    bucket = "2025_03_tf_demo"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "upbeat-agent-348004"
  region  = "australia-southeast2"
}
