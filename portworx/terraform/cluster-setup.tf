# cluster-setup.tf

resource "google_container_cluster" "bp_cluster" {
  name                     = "bp-cluster"
  location                 = "europe-west1-c"
  initial_node_count       = 3

  node_config {
    machine_type     = "n1-standard-4"
    image_type       = "ubuntu_containerd"

    local_nvme_ssd_block_config {
      local_ssd_count = 1
    }
  }
}
