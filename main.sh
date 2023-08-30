#!/bin/bash

# Define conditional variables for modules
MODULE_1_ENABLED=true
MODULE_2_ENABLED=true

# Function to generate the main.tf file based on module status
generate_main_tf() {
  main_tf_file="main.tf"
  echo 'terraform {' > "$main_tf_file"
  echo '  required_providers {' >> "$main_tf_file"
  echo '    azapi = {' >> "$main_tf_file"
  echo '      source = "azure/azapi"' >> "$main_tf_file"
  echo '    }' >> "$main_tf_file"
  echo '  }' >> "$main_tf_file"
  echo '}' >> "$main_tf_file"

  echo '' >> "$main_tf_file"
  echo 'provider "azapi" {}' >> "$main_tf_file"
  
  echo '' >> "$main_tf_file"
  echo 'provider "azurerm" {' >> "$main_tf_file"
  echo '  features {}' >> "$main_tf_file"
  echo '}' >> "$main_tf_file"

  echo '' >> "$main_tf_file"
  echo 'resource "azurerm_resource_group" "rggroup1" {' >> "$main_tf_file"
  echo '  name     = "johnterraform-rg"' >> "$main_tf_file"
  echo '  location = "eastus2"' >> "$main_tf_file"
  echo '}' >> "$main_tf_file"

  if [[ "$MODULE_1_ENABLED" == "true" ]]; then
    echo '' >> "$main_tf_file"
    echo 'module "web-app" {' >> "$main_tf_file"
    echo '  source   = "./module/compute/appservice"' >> "$main_tf_file"
    echo '}' >> "$main_tf_file"
  fi

  if [[ "$MODULE_2_ENABLED" == "true" ]]; then
    echo '' >> "$main_tf_file"
    echo 'module "webappplan1" {' >> "$main_tf_file"
    echo '  source      = "./module/compute/appserviceplan"' >> "$main_tf_file"
    echo '}' >> "$main_tf_file"
  fi

  # You can add more modules and conditions as needed
}

# Call the function to generate main.tf
generate_main_tf

# Run terraform init and apply
terraform init
terraform apply
