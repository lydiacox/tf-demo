resource "google_compute_network" "self" {
  name                    = "vpc-${var.name}"
  project                 = var.project
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "self" {
  name          = "sb-${var.name}-au-se2"
  project       = var.project
  region        = var.region
  network       = google_compute_network.self.id
  ip_cidr_range = "10.128.0.0/24"
}
