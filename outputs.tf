output "metadata" {
  value = helm_release.release.*.metadata
}
