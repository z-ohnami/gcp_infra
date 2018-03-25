resource "google_compute_firewall" "good-sleep-fw" {
  name    = "good-sleep-fw"
  network = "${google_compute_network.good-sleep-nw.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  target_tags = ["${google_compute_instance.wp-app.tags}"]
}
