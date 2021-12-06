locals {
  labels = merge({
    env       = var.env,
    name      = var.name,
    app_name  = var.app_name,
    team      = var.team
    cost_type = var.cost_type
  }, var.labels)
}
