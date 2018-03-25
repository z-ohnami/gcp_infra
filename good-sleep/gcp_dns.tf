resource "google_dns_managed_zone" "good-sleep-dns-zone" {
  name     = "good-sleep-dns-zone"
  dns_name = "${file("credentials/dns_name.txt")}"
}

resource "google_dns_record_set" "good-sleep-dns-record-set" {
  name = "${google_dns_managed_zone.good-sleep-dns-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.good-sleep-dns-zone.name}"

  rrdatas = [
    "${google_compute_address.good-sleep-address.address}"
  ]
}

resource "google_dns_record_set" "good-sleep-dns-record-set-www" {
  name = "www.${google_dns_managed_zone.good-sleep-dns-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.good-sleep-dns-zone.name}"

  rrdatas = [
    "${google_compute_address.good-sleep-address.address}"
  ]
}

# resource "google_dns_record_set" "wp-dns-record-set-ns" {
#   name = "${google_dns_managed_zone.wp-dns-zone.dns_name}"
#   type = "NS"
#   ttl  = 300

#   managed_zone = "${google_dns_managed_zone.wp-dns-zone.name}"

#   rrdatas = [
#     "ns-cloud-b1.googledomains.com.",
#     "ns-cloud-b2.googledomains.com.",
#     "ns-cloud-b3.googledomains.com.",
#     "ns-cloud-b4.googledomains.com."
#   ]
# }
