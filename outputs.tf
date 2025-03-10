output "network_id" {
  value = google_compute_network.self.id
}

output "network_self_link" {
  value = google_compute_network.self.self_link
}

output "subnetwork_id" {
  value = google_compute_subnetwork.self.id
}

output "subnetwork_self_link" {
  value = google_compute_subnetwork.self.self_link
}

output "compute_instance_ids" {
  value = [google_compute_instance.self.*.id]
}
