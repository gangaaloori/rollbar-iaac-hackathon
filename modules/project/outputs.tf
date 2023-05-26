output "project_id" {
  value       = rollbar_project.this.id
  description = "ID of the Rollbar project"
}

output "project_api_key" {
  value       = rollbar_project_access_token.this.access_token
  description = "Project access token with read & write scopes, needed for project configuration"
}