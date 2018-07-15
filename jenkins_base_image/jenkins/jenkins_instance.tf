resource "google_compute_instance" "thegaijin-jenk8ns" {
  name         = "thegaijin-jenk8ns"
  machine_type = "${var.thegaijin_jenk8ns_machine_type}"
  zone         = "${var.thegaijin_jenk8ns_zone}"

  tags = ["thegaijin-jenk8ns"]

  boot_disk {
    initialize_params {
      image = "${var.thegaijin_jenk8ns_base_image}"
    }
  }

  network_interface {
    network = "${google_compute_network.jenk8ns-network.name}"

    access_config = {
      nat_ip = ""
    }
  }

  metadata {
    serviceAccountEmail = "${var.thegaijin_service_account_email}"
    serial-port-enable  = 1
  }

  service_account {
    email  = "${var.thegaijin_service_account_email}"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_compute_firewall" "jenk8ns_instance_firewall" {
  name    = "jenkins-instance-firewall"
  network = "${google_compute_network.jenk8ns-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["jenk8ns-instance"]
}
