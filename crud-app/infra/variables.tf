variable "render_api_key" {
  description = "API key for Render"
  type        = string
  sensitive   = true  # Prevents Terraform from showing it in plain text
}

variable "database_url" {
  description = "Connection string for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "github_repo_url" {
  description = "The URL of the GitHub repo to deploy"
  type        = string
  default     = "https://github.com/RedzerRiley/devops-pipelines-project-demo"
}


variable "render_owner_id" {
  description = "Your Render User ID (usr-...) or Team ID (tea-...)"
  type        = string
}

