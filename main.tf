locals {
  release = merge(
    local.helm_defaults,
    {
      name          = "release"
      namespace     = "release"
      chart         = "release"
      enabled       = true
      repository    = "https://kubernetes-charts.storage.googleapis.com/"
      chart_version = "1.0.0"
      create_ns     = true
    },
    var.release
  )
}

resource "kubernetes_namespace" "release" {
  count = local.release["create_ns"] ? 1 : 0

  metadata {
    labels = {
      name = local.release["namespace"]
    }

    name = local.release["namespace"]
  }
}

resource "helm_release" "release" {
  count                 = local.release["enabled"] ? 1 : 0
  repository            = local.release["repository"]
  name                  = local.release["name"]
  chart                 = local.release["chart"]
  version               = local.release["chart_version"]
  timeout               = local.release["timeout"]
  force_update          = local.release["force_update"]
  recreate_pods         = local.release["recreate_pods"]
  wait                  = local.release["wait"]
  atomic                = local.release["atomic"]
  cleanup_on_fail       = local.release["cleanup_on_fail"]
  dependency_update     = local.release["dependency_update"]
  disable_crd_hooks     = local.release["disable_crd_hooks"]
  disable_webhooks      = local.release["disable_webhooks"]
  render_subchart_notes = local.release["render_subchart_notes"]
  replace               = local.release["replace"]
  reset_values          = local.release["reset_values"]
  reuse_values          = local.release["reuse_values"]
  skip_crds             = local.release["skip_crds"]
  verify                = local.release["verify"]
  values = [
    local.release["values"]
  ]
  namespace = local.release["create_ns"] ? kubernetes_namespace.release.*.metadata.0.name[count.index] : local.release["namespace"]
}
