variable "thegaijin_jenk8ns_region" {
  type    = "string"
  default = "europe-west1"
}

variable "thegaijin_jenk8ns_zone" {
  type    = "string"
  default = "europe-west1-b"
}

variable "thegaijin_jenk8ns_base_image" {
  type    = "string"
  default = "thegaijin-jenk8ns"
}

variable "thegaijin_jenk8ns_project_id" {
  type    = "string"
  default = "andela-learning"
}

variable "thegaijin_jenk8ns_credential_file" {
  type    = "string"
  default = "/Users/svictor/DevOps/gcp/andela-learning-22734c57a9a3.json"
}

variable "thegaijin_jenk8ns_ip_cidr_range" {
  type    = "string"
  default = "10.0.0.0/24"
}

variable "thegaijin_service_account_email" {
  type    = "string"
  default = "thegaijin@andela-learning.iam.gserviceaccount.com"
}

variable "thegaijin_jenk8ns_machine_type" {
  type    = "string"
  default = "n1-standard-1"
}
