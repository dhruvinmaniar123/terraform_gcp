provider "google" {
  credentials = file("../terraform-gcp-320716-cc4f20273242.json")

  project = "terraform-gcp-320716"
  region  = "var.region"
  zone    = var.zone
}
