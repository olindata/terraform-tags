# Outputs of this module
output "id" {
  value       = "${null_resource.default.triggers.id}"
  description = "Disambiguated ID"
}

output "stage" {
  value       = "${null_resource.default.triggers.stage}"
  description = "Normalized name"
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
          "Name", "${null_resource.default.triggers.id}",
          "Stage", "${null_resource.default.triggers.stage}",
          "Client", "${null_resource.default.triggers.client}",
          "StackName", "${null_resource.default.triggers.stack_name}",
          "Terraform", "true"
        ), var.tags
      )
    }"

  description = "Normalized tag map"
}
