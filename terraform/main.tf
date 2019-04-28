variable "do_token" {}

variable "k8s_cluster_name" {
  default = "k8s-nyc1"
}

variable "k8s_cluster_region" {
  default = "nyc1"
}

variable "k8s_cluster_version" {
  default = "1.13.5-do.1"
}

variable "k8s_node_instance_size" {
  default = "s-2vcpu-2gb"
}

variable "k8s_node_pool_size" {
  default = 2
}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "do_k8s_cluster" {
  name = "${var.k8s_cluster_name}"
  region = "${var.k8s_cluster_region}"
  version = "${var.k8s_cluster_version}"

  node_pool {
    name = "${var.k8s_cluster_name}-main-pool"
    size = "${var.k8s_node_instance_size}"
    node_count = "${var.k8s_node_pool_size}"
  }
}

output "kubeconfig" {
  value = "${digitalocean_kubernetes_cluster.do_k8s_cluster.kube_config.0.raw_config}"
}
