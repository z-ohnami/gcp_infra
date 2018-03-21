resource "google_compute_global_forwarding_rule" "wp-global-forwading-rule" {
  name       = "wp-global-forwading-rule"
  target     = "${google_compute_target_http_proxy.wp-target-http-proxy.self_link}"
  # ip_version = "IPV4"
  ip_address = "${google_compute_global_address.wp-global-address.address}"
  ip_protocol = "HTTP"
  port_range = "80"
}

resource "google_compute_target_http_proxy" "wp-target-http-proxy" {
  name        = "wp-target-http-proxy"
  url_map     = "${google_compute_url_map.wp-url-map.self_link}"
}

resource "google_compute_url_map" "wp-url-map" {
  name            = "wp-url-map"
  description     = "wp-url-map"
  default_service = "${google_compute_backend_service.wp-backend-service.self_link}"

  # host_rule {
  #   hosts        = ["good-sleep.tips"]
  #   path_matcher = "allpaths"
  # }

  # path_matcher {
  #   name            = "allpaths"
  #   default_service = "${google_compute_backend_service.wp-backend-service.self_link}"

  #   path_rule {
  #     paths   = ["/*"]
  #     service = "${google_compute_backend_service.wp-backend-service.self_link}"
  #   }
  # }
}

resource "google_compute_backend_service" "wp-backend-service" {
  name        = "wp-backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 30
  enable_cdn  = false

  backend {
    # group = "${google_compute_instance_group_manager.webservers.instance_group}"
    group = "${google_compute_instance_group.wp-app-group.self_link}"
  }

  health_checks = ["${google_compute_health_check.wp-health-check.self_link}"]
}

resource "google_compute_health_check" "wp-health-check" {
  name = "wp-health-check"

  timeout_sec        = 5
  check_interval_sec = 5

  tcp_health_check {
    port = "80"
  }
}
