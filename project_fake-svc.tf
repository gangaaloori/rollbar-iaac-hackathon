
# Create project
module "project_fake-svc" {
  source = "./modules/project"

  name            = "fake-svc"
  rollbar_api_key = var.rollbar_api_key
}

# Configure the project
module "config_fake-svc" {
  source = "./modules/config"

  service_account_id = var.slack_service_account_id
  project_api_key    = module.project_fake-svc.project_api_key
  rollbar_env_slack_channel_map = {
    "wip.in"  = "dev-alerts"
    "stg.in"  = "dev-alerts"
    "prod.in" = "prod-alerts"
  }
}