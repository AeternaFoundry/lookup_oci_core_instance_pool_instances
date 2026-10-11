data "oci_core_instance_pool_instances" "core_instance_pool_instances_lookup" {
  for_each = var.core_instance_pool_instances_lookup

  compartment_id   = each.value.compartment_id
  instance_pool_id = each.value.instance_pool_id
  display_name     = each.value.display_name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

