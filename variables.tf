variable "rollbar_api_key" {
  type        = string
  description = "Rollbar API key"
  sensitive   = true
}

variable "slack_service_account_id" {
  type        = string
  description = "Slack service account Id"
  default     = "T05867TE04T"
}