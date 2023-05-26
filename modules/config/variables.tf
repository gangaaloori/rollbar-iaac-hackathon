
variable "service_account_id" {
  type        = string
  description = "Slack service account ID"
}

variable "project_api_key" {
  type        = string
  description = "Project access token with 'read' and 'write' scopes, generated by the 'project' module"
}

variable "dd_service_link_url" {
  type        = string
  description = "DataDog Service Link URL"
  default     = "https://app.datadoghq.eu/apm/trace/{{custom.rollbar-logback.mdc.'dd.trace_id'}}?spanID={{custom.rollbar-logback.mdc.'dd.span_id'}}"
}