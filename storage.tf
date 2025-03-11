resource "google_storage_bucket" "self" {
  count = 3

  name                        = "bk-${var.name}-${count.index}"
  location                    = var.region
  project                     = var.project
  uniform_bucket_level_access = true
}
