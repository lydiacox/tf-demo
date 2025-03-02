terraform {
  backend "gcs" {
    bucket = "2025_03_18_tf_demo"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "programmable-demo-2025"
  region  = "australia-southeast2"
  zone = "australia-southeast2-b"
}
