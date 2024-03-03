resource "yandex_compute_instance" "runner" {
  name     = "runner"
  zone     = var.yc_region2
  hostname = "runner.${var.domain_name}"
  resources {
    core_fraction = var.core_fraction
    cores         = 4
    memory        = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      name     = "root-runner"
      type     = "network-nvme"
      size     = "10"
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
