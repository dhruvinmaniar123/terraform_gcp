
provider "google" {
  credentials = file("~/Downloads/terraform-gcp-320716-cc4f20273242.json")

  project = "terraform-gcp"
  region  = "asia-south1"
}

resource "google_compute_network" "main" {
  name = "main"
}
	
