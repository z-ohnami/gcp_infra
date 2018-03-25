provider "google" {
  credentials = "${file("credentials/key.json")}"
  project     = "db-infra"
  region      = "asia-northeast1"
}
