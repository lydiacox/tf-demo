resource "google_compute_instance" "self" {
  name                      = "vm-${var.name}"
  project                   = var.project
  machine_type              = "e2-micro"
  zone                      = var.zone
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
    email  = google_service_account.self.email
    scopes = ["cloud-platform"]
  }
}

# import {
#   to = google_compute_instance.self
#   id = "projects/programmable-demo-2025/zones/australia-southeast2-b/instances/vm-programmable-demo"
# }
