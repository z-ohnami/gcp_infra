resource "google_sql_database_instance" "lemon" {
  name = "lemon"
  database_version = "MYSQL_5_7"
  region = "asia-northeast1"

  settings {
    tier = "db-f1-micro"
    disk_type = "PD_HDD"
    disk_size = 10
    location_preference {
      zone = "asia-northeast1-a"
    }
  }
}

resource "google_sql_database" "good-sleep" {
  name      = "good-sleep"
  instance  = "${google_sql_database_instance.lemon.name}"
  charset   = "utf8mb4"
  collation = "utf8mb4_general_ci"
}

resource "google_sql_user" "good-sleep-user" {
  name     = "good-sleep-user"
  instance = "${google_sql_database_instance.lemon.name}"
  password = "${file("credentials/password.txt")}"
}
