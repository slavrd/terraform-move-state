module "rnd_pet" {
  source             = "./module-rnd-pet"
  pet_name_length    = "4"
  pet_name_separator = "-"
}

resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo Hello ${module.rnd_pet.pet_id}"
  }
}
