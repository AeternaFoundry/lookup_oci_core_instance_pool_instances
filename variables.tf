variable "core_instance_pool_instances_lookup" {
  description = <<EOT
Map of core_instance_pool_instances_lookup, attributes below
Required:
    - compartment_id
    - instance_pool_id
Optional:
    - display_name
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id   = string
    instance_pool_id = string
    display_name     = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

