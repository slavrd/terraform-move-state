# Terraform move state

A simple terraform project to demonstrate how to move existing resources in the current state.

The purpose is to show how a terraform configuration can be refactored to use a module for resource management without this causing recreation of the already existing resources:

Demonstration steps:

* Apply a terraform configuration that creates a random_pet and a null_resource.
* Refactor the configuration so that it uses a module to create the random_pet.
* In the terraform state, move the existing random_pet to the module so that applying the refactored configuration will not recreate it.

## Prerequisites

* Install Terraform - [instructions](https://www.terraform.io/intro/getting-started/install.html#installing-terraform)

## Running the demonstration

### Step 1 - Apply the initial Terraform configuration

* Copy the configuration to the current directory - `cp tf-config-initial/main.tf .`
* Initialize Terraform - `terraform init`
* Apply the configuration - `terraform apply`

At this point Terraform has created a random_pet and a null_resource.

### Step 2 - Refactor the configuration to use a module for the random_pet resource

* Copy the refactored configuration - `cp tf-config-module/main.tf .`
* Get the module - `terraform get`

At this point applying the terraform configuration will result in destruction of the random_pet resource created in step 1 and creation of a new random_pet via the module used in the refactored configuration.

To verify this run `terraform plan` . The result should look like:

![Terraform plan - change](screenshots/tf-plan-change.png)

### Step 3 - Move the random_pet to the module

To avoid the random_pet recreation we need to move the existing resource to the module in the terraform state.

Run - `terraform state mv random_pet.name module.rnd_pet.random_pet.pet`

Run - `terraform plan` to verify that no changes will be made if the refactored configuration is applied.

The result should look like:

![Terraform plan - change](screenshots/tf-plan-no-change.png)

Run - `terraform destroy` and both resources will be destroyed.