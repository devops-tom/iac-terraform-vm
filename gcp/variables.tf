variable "name" {
  default = "project"
}

variable "project" {
  default = ""
}

variable "location" {
  default = "europe-west2-a"
}

variable "initial_node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "min_pool_nodes" {
  default = 1
}

variable "max_pool_nodes" {
  default = 10
}

variable "user" {
  default = "user"
}

variable "password" {
  default = "password"
}

variable "credentials" {
  default = ""
}

