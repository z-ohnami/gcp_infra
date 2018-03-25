resource "google_compute_disk" "good-sleep-disk" {
  name  = "good-sleep-disk"
  type  = "pd-standard"
  zone  = "asia-northeast1-a"
  size  = 10
}
