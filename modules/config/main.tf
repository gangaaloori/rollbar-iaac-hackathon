
# Enable Slack integration
resource "rollbar_integration" "slack" {
  slack {
    enabled            = true
    channel            = "dev-alerts"
    service_account_id = var.service_account_id
  }
}

# Configure Slack alerts
resource "rollbar_notification" "slack" {
  rule {
    filters {
      type      = "environment"
      operation = "eq"
      value     = "wip.in"
    }
    filters {
      type      = "level"
      operation = "gte"
      value     = "error"
    }
    trigger = "new_item"
  }
  channel = "slack"
  config {
    show_message_buttons = true
    channel              = "dev-alerts"
  }
  depends_on = [rollbar_integration.slack]
}

# Create Service Links - Datadog
resource "rollbar_service_link" "datadog" {
  name     = "DataDog Trace"
  template = var.dd_service_link_url
}