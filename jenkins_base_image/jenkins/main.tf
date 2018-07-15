provider "google" {
  credentials = "${file("${var.thegaijin_jenk8ns_credential_file}")}"
  project     = "${var.thegaijin_jenk8ns_project_id}"
  region      = "${var.thegaijin_jenk8ns_region}"
}
