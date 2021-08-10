variable "region" {
  type = map(any)
  default = {
    "india" = "asia-south1"
  }
}

variable "zone" {
  default = "asia-south1-b"
}

variable "name_count" {
  default=["server1", "server2", "server3"]

}