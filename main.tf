resource "google_compute_instance" "self" {
  count = var.vm_count

  name         = "vm-${var.name}-${count.index}"
  project      = var.project
  machine_type = "e2-micro"
  zone         = var.zone
  allow_stopping_for_update = true

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

  service_account {
    email = google_service_account.self.email
    scopes = ["cloud-platform"]
  }
}
