resource "random_id" "instance_id_1" {
 byte_length = 8
}

resource "google_compute_disk" "pd" {
  name    = "data-disk"
  type    = "pd-ssd"
  zone    = var.location
  size    = 10
}

// A single Compute Engine instance
resource "google_compute_instance" "vm_1" {
 name         = "compute-${var.location}-${random_id.instance_id_1.hex}"
 depends_on = [google_compute_network.vpc]
 machine_type = var.machine_type
 zone         = var.location

 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-2004-lts"
   }
 }
 
 attached_disk {
    source      = google_compute_disk.pd.self_link
    device_name = "data-disk-0"
    mode        = "READ_WRITE"
  }
 
 metadata = {
   ssh-keys = "key"
 }

 network_interface {
   network = var.name

   access_config {
     // Include this section to give the VM an external ip address
   }
  }
 // Apply the firewall rule to allow external IPs to access this instance
  tags = ["web"]
}
