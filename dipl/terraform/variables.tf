# Variables
variable "yc_token" {
  default = "y0_AgA"
}

variable "yc_cloud_id" {
  default = "b1g"
}

variable "yc_folder_id" {
  default = "b1g"
}

variable "domain_name" {
  default = "cmdhellothere.dipl"
}

variable "test_cert" {
  default = "--test-cert" // TEST
  //  default = "" // PROD
  // Использовать "" для PROD и "--test-cert" для TEST SSL certificate
}

variable "database_name" {
  default = "wordpress"
}

variable "database_user" {
  default = "wordpress"
}

variable "database_password" {
  default = "wordpress"
}

variable "database_replication_masternode" {
  default = "db01"
}

variable "database_replication_user" {
  default = "replicausr"
}

variable "database_replication_user_password" {
  default = "REplicauserpass123"
}

variable "gitlab_root_password" {
  default = "gitlabroopass0rd"
}

variable "gitlab_runner_token" {
  default = "tokentokentoken"
}

variable "grafana_password" {
  default = "grafana_password"
}

variable "image_id" {
  default = "fd81u2vhv3mc49l1ccbb"
}

variable "core_fraction" {
  type    = number
  default = 20
}

variable "preemptible" {
  type    = bool
  default = true
}

variable "yc_region" {
  default = "ru-central1-a"
}

variable "yc_region2" {
  default = "ru-central1-b"
}

variable "nat_ip_address" {
  default = "130.193.49.218"
}

variable "public_key_path" {
  description = "Path to ssh public key, which would be used to access workers"
  default     = "~/.ssh/yand.pub"
}

variable "private_key_path" {
  description = "Path to ssh private key, which would be used to access workers"
  default     = "~/.ssh/yand"
}

variable "xrdp_password" {
  type = string
}

variable "user" {
  type = string
  default = "zamba"
}

