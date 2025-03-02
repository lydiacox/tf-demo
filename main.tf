resource "google_project_service" "self" {
  for_each = toset([
    "sql-component.googleapis.com",
    "run.googleapis.com",
  ])

  project = var.project
  service = each.key
}

resource "google_compute_instance" "self" {
  count = var.vm_count

  name         = "vm-${var.name}-${count.index}"
  project      = var.project
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.self.id
  }
}
