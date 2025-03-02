resource "google_service_account" "self" {
  account_id = "sa-${var.name}"
  project    = var.project
}

resource "google_project_iam_member" "self" {
  for_each = toset([
    "roles/compute.instanceAdmin",
    "roles/storage.admin",
  ])

  project = var.project
  member  = "serviceAccount:${google_service_account.self.email}"
  role    = each.key
}
