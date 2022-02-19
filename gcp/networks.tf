resource "google_compute_network" "vpc" {
  name                    = var.name
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "ssh-in-firewall" {
  name    = "firewall-ssh-in"
  network = var.name
  depends_on = [google_compute_network.vpc]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

}

resource "google_compute_firewall" "web-firewall" {
  name    = "firewall-web-in"
  network = var.name
  depends_on = [google_compute_network.vpc]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  source_tags = ["web"]
}
