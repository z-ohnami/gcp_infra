resource "google_compute_global_address" "wp-global-address" {
  name = "wp-global-address"
  ip_version = "IPV4"
}
