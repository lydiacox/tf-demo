resource "google_project_service" "name" {
  for_each = toset([
    "compute.googleapis.com",
    "iam.googleapis.com",
    "storage.googleapis.com"
  ])

  project = var.project
  service = each.key
}

resource "google_compute_network" "demo" {
  name                    = "vpc-demo"
  project                 = var.project
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "au_se2" {
  name          = "sb-demo-au-se2"
  project       = var.project
  region        = var.region
  network       = google_compute_network.demo.id
  ip_cidr_range = "10.0.0.0/24"
}

resource "google_compute_instance" "demo" {
  name         = "vm-demo"
  project      = var.project
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20250212"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.au_se2.id
  }
}

resource "google_service_account" "demo" {
  account_id = "sa-demo"
  project    = var.project
}

resource "google_project_iam_member" "demo" {
  for_each = toset([
    "roles/compute.instanceAdmin",
    "roles/storage.admin",
  ])

  project = var.project
  member  = "serviceAccount:${google_service_account.demo.email}"
  role    = each.key
}
