resource "google_compute_instance_group" "wp-app-group" {
  name        = "wp-app-group"
  description = "wp-app-group"
  zone        = "asia-northeast1-a"
  network     = "${google_compute_network.good-sleep-nw.self_link}"
  instances = [
    "${google_compute_instance.wp-app.self_link}"
  ]
}
