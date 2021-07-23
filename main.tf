terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.76.0"
    }
  }
}

provider "google" {
  credentials = file("mydemoproject-316509-675aa88cefb3.json")

  project = "mydemoproject"
  region  = "asia-south1"
  zone    = "asia-south1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
