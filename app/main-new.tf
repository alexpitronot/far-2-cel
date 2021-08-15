# Configure GCP project
provider "google" {
  project = "far-2-cel"
}
# Deploy image to Cloud Run
resource "google_cloud_run_service" "far-2-cel" {
  name     = "far-2-cel"
  location = "us-central1"
  template {
    spec {
      containers {
        image = "docker.io/agorbach/far-2-cel:v0.1"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}
# Create public access
data "google_iam_policy" "use-terraform" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
# Enable public access on Cloud Run service
resource "google_cloud_run_service_iam_policy" "use-terraform" {
  location    = google_cloud_run_service.far-2-cel.location
  project     = google_cloud_run_service.far-2-cel.project
  service     = google_cloud_run_service.far-2-cel.name
  policy_data = data.google_iam_policy.noauth.policy_data
}
# Return service URL
output "url" {
  value = "${google_cloud_run_service.mywebapp.status[0].url}"
}