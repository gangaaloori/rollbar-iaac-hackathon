terraform {
  required_providers {
    rollbar = {
      source = "rollbar/rollbar"
    }
  }
}

# Configure Rollbar provider with the Project access token
provider "rollbar" {
  project_api_key = var.project_api_key
}