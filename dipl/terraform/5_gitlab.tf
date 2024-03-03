resource "yandex_compute_instance" "gitlab" {
  name     = "gitlab"
  zone     = var.yc_region2
  hostname = "gitlab.${var.domain_name}"
  resources {
    core_fraction = var.core_fraction
    cores         = 4
    memory        = 8
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      name     = "root-gitlab"
      type     = "network-nvme"
      size     = "15"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.default-ru-central1-b.id
    nat       = false
  }
  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  depends_on = [
    yandex_vpc_subnet.default-ru-central1-b
  ]
}
