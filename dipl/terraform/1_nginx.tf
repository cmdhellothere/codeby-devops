resource "yandex_compute_instance" "nginx" {
  name     = "nginx"
  zone     = var.yc_region
  hostname = var.domain_name
  resources {
    core_fraction = var.core_fraction
    cores         = 2
    memory        = 2
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      name     = "root-nginx"
      type     = "network-nvme"
      size     = "10"
    }
  }
  network_interface {
    subnet_id      = yandex_vpc_subnet.default-ru-central1-a.id
    nat            = true
    nat_ip_address = var.nat_ip_address
  }
  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.user}:${var.xrdp_password}' | sudo chpasswd",
      "sudo apt-get update -y",
      "sudo DEBIAN_FRONTEND=noninteractive apt-get install xrdp ubuntu-desktop -y",
      "sudo systemctl enable xrdp",
      "sudo ufw allow 3389/tcp",
      "sudo /etc/xrdp/startwm.sh",
      "sudo /etc/init.d/xrdp restart"
    ]
    connection {
      type = "ssh"
      user = var.user
      private_key = file(var.private_key_path)
      host = self.network_interface[0].nat_ip_address
    }
  }

  depends_on = [
    yandex_vpc_subnet.default-ru-central1-a
  ]
}
