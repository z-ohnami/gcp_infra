resource "google_compute_disk" "wp-disk" {
  name  = "wp-disk"
  type  = "pd-standard"
  zone  = "asia-northeast1-a"
  size  = 10
}
