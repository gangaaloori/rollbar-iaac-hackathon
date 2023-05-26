terraform {
  required_providers {
    rollbar = {
      source = "rollbar/rollbar"
    }
  }
}

# Configure Rollbar provider with the API key
provider "rollbar" {
  api_key = var.rollbar_api_key
}