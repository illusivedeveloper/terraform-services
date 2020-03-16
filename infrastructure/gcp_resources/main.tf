provider "google" {
  credentials = file(var.file_path)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "random_id" "instance_id" {
  byte_length = 8
}


resource "google_compute_instance" "vm-instance" {
  count = var.instance_count
  name         = "${var.name}-${count.index}"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    access_config {
    }
  }

  metadata = {
    ssh-keys = "${var.user}:${file(var.ssh_key)}"
  }

}
