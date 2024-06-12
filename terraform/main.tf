provider "google" {
  project = var.project
  region  = var.region
}

resource "google_compute_instance" "app_server" {
  name         = "app-instance"
  machine_type = "f1-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external IP address
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    echo ${google_compute_instance.app_server.network_interface[0].access_config[0].nat_ip} > /var/www/html/ip_address.txt
  EOF
}

output "instance_ip" {
  value = google_compute_instance.app_server.network_interface[0].access_config[0].nat_ip
}
