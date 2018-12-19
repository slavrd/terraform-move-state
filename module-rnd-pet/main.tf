variable "pet_name_length" {}

variable "pet_name_separator" {}

resource "random_pet" "pet" {
  length    = "${var.pet_name_length}"
  separator = "${var.pet_name_separator}"
}

output "pet_id" {
  value = "${random_pet.pet.id}"
}
