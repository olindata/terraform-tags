# A null resource which allows us to collect data, make local vars out of it, and trigger updates if/when changed
resource "null_resource" "default" {
  triggers = {
    id         = "${lower(join(var.delimiter, compact(concat(list(var.client, var.stage, var.name)))))}"
    name       = "${substr(lower(format("%v", var.name)),0,length(var.name) > 3 ? 3 : -1 )}"    # Enforce length of 3
    stage      = "${substr(lower(format("%v", var.stage)),0,  length(var.stage) > 4 ? 4 : -1    )}"   # Enforce length of 4
    client     = "${substr(lower(format("%v", var.client)),0, length(var.client) > 3 ? 3 : -1  )}"  # Enforce length of 3
    stack_name = "${lower(format("%v", var.stack_name))}"
  }

  lifecycle {
    create_before_destroy = true
  }
}