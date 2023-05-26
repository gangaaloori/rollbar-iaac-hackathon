# Create project
resource "rollbar_project" "this" {
  name = var.name
}


# Create project access token with all the scopes
resource "rollbar_project_access_token" "this" {
  name       = "rollbar-iaac-token"
  project_id = rollbar_project.this.id
  scopes     = ["read", "write", "post_client_item", "post_server_item"]
  depends_on = [rollbar_project.this]
}