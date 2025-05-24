provider "google" {
  project = "alert-weaver-456505-p4"
  region  = "us-central1"
}

resource "google_service_account" "employee" {
  account_id   = "employee-access"
  display_name = "Employee Access Service Account"
}

resource "google_project_iam_binding" "employee_role" {
  project = "alert-weaver-456505-p4"
  role    = "roles/viewer"

  members = [
    "serviceAccount:${google_service_account.employee.email}"
  ]
}
