# GCP Terraform Authentication Methods

The Google Cloud Platform provides requires the private credentials json file to authenticate. We can setup the authentication as follows:
>Login to cloud console and select a project. Go to project IAM Admin page and follow these steps to create service account key: [Setup Account Credentials](https://cloud.google.com/iam/docs/creating-managing-service-account-keys#creating_service_account_keys)

The downloaded file can be than provided to terraform script as follows: 
```
provider "google" {
  credentials = file("account.json")
  project     = "my-project-id"
  region      = "us-central1"
}
```

# Additional Input Attributes
The additional input resource attributes can be passed on to main.tf file from [here](https://www.terraform.io/docs/providers/google/d/datasource_compute_instance.html#attributes-reference).