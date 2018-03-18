resource "google_compute_network" "good-sleep-nw" {
  name = "good-sleep-nw"
}
resource "google_compute_subnetwork" "good-sleep-sub-nw" {
  name          = "good-sleep-sub-nw"
  ip_cidr_range = "10.0.0.0/16"
  network       = "${google_compute_network.good-sleep-nw.name}"
  description   = "good-sleep-sub-nw"
  region        = "asia-northeast1"
}
