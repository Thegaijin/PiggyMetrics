resource "google_compute_network" "jenk8ns-network" {
  name = "jenk8ns-network"
}

resource "google_compute_subnetwork" "jenk8ns-private-subnetwork" {
  name          = "jenk8ns-private-subnetwork"
  region        = "${var.thegaijin_jenk8ns_region}"
  network       = "${google_compute_network.jenkins-network.self_link}"
  ip_cidr_range = "${var.thegaijin_jenk8ns_ip_cidr_range}"
}
