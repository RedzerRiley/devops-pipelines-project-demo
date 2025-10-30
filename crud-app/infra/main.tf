# 1. Define required providers and versions
terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.7"
    }
  }
}

# 2. Configure the Render provider
provider "render" {
  api_key  = var.render_api_key  # Gets value from variables.tf
  owner_id = var.render_owner_id # <-- Add this line
}
# 3. Define the web service
resource "render_web_service" "web_app" {
  name = "ci-demo-app"
  plan = "starter" # This was correct

  # 1. Add the MISSING "region"
  # Valid values are: "oregon", "ohio", "frankfurt", "singapore"
  region = "oregon"

  # 2. Add the MISSING "runtime_source" block
  # All your "Unsupported" arguments go inside here,
  # nested inside a "docker" block.
  runtime_source = {
    docker = {
      repo_url      = var.github_repo_url
      auto_deploy   = true
      branch        = "main"
      build_command = "docker build -t app ."
      start_command = "docker run -p 3000:3000 app"
    }
  }

  # 3. Fix the "env_vars" format
  # It's a map of objects, where the map key is the variable name
  env_vars = {
    "DATABASE_URL" = {
      value  = var.database_url
      secret = true # Best practice to mark this
    }
  }
}

