locals {
  # Naming convention
  prefix = "seir"

  network_name = "${local.prefix}-${var.network_name}"
  subnet_name  = "${local.prefix}-${var.subnet_name}"
  cluster_name = "${local.prefix}-${var.cluster_name}"

  # Workload Identity
  workload_pool = "${var.project_id}.svc.id.goog"

  # Common labels
  common_labels = {
    environment = "lab"
    owner       = "student"
  }
}
