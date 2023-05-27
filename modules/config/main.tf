
# Enable Slack integration
resource "rollbar_integration" "slack" {
  slack {
    service_account_id   = var.service_account_id
    channel              = "dev-alerts"
    show_message_buttons = true
    enabled              = true
  }
}

# Configure Slack alerts
resource "rollbar_notification" "slack" {

  for_each = var.rollbar_env_slack_channel_map
  rule {
    filters {
      type      = "environment"
      operation = "eq"
      value     = each.key
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
    channel              = each.value
  }

  provisioner "local-exec" {
    command = "python scripts/rollbar.py ${each.key}"
  }

  depends_on = [rollbar_integration.slack]
}

# Create Service Links - Datadog
resource "rollbar_service_link" "datadog" {
  name     = "DataDog Trace"
  template = var.dd_service_link_url
}