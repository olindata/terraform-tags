# Outputs of this module
output "id" {
  value       = "${null_resource.default.triggers.id}"
  description = "Disambiguated ID"
}

output "name" {
  value       = "${null_resource.default.triggers.name}"
  description = "Normalized name"
}

output "stage" {
  value       = "${null_resource.default.triggers.stage}"
  description = "Normalized stage"
}

output "client" {
  value       = "${null_resource.default.triggers.client}"
  description = "Normalized client name"
}

output "stack_name" {
  value       = "${null_resource.default.triggers.stack_name}"
  description = "Normalized stack_name"
}

# Merge input tags with our tags.
output "tags" {
  value = "${
      merge(
        map(
          "Id", "${null_resource.default.triggers.id}",
          "Name", "${null_resource.default.triggers.name}",
          "Stage", "${null_resource.default.triggers.stage}",
          "Client", "${null_resource.default.triggers.client}",
          "StackName", "${null_resource.default.triggers.stack_name}",
          "Terraform", "true"
        ), var.tags
      )
    }"

  description = "Normalized tag map"
}

# Use the same tag map as above, but autoscalers expect a list instead of a map
output "asg_tags" {
  value = ["${
    list(
      map("key", "Id", "value", null_resource.default.triggers.id, "propagate_at_launch", true),
      map("key", "Name", "value", null_resource.default.triggers.name, "propagate_at_launch", true),
      map("key", "Stage", "value", null_resource.default.triggers.stage, "propagate_at_launch", true),
      map("key", "Client", "value", null_resource.default.triggers.client, "propagate_at_launch", true),
      map("key", "StackName", "value", null_resource.default.triggers.stack_name, "propagate_at_launch", true),
      map("key", "Terraform", "value", "true", "propagate_at_launch", true)
    )
  }"]

  description = "Normalized tag list for an autoscaler to propogate tags"
}
