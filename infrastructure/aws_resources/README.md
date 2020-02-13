# AWS Authentication Methods
Terraform provides several means of providing credentials for authentication. They are mentioned as follows:
1. Static
2. Environment variables
3. Shared Credentials file (preferred method)
4. EC2 Role (only if running this script on EC@ instance)

# Static credentials

Static credentials can be provided by adding the following input sources in the providers block of the main.tf file:
```
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```
However, this method is not preferred and should be only used for testing purpose. As this method plainly exposes the AWS account credentials.
# Environment Variables

We can also export the AWS credentials as environment variables on the host workstation for authentication.
However, this method will override the user of Shared credentials file method.
To export credentials use:
```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
```
Then simply run the terraform script using:
```$ terraform plan```
Here we can also export other input sources such as region, etc as environment.
In terraform script:
```
provider "aws" {}
```
# Shared Credentials file

This method is used in this script. This method also used in [aws-cli]([https://aws.amazon.com/cli/](https://aws.amazon.com/cli/)) tool.
We can specify our AWS account credentials at this location on the host workstation: ```$HOME/.aws/credentials```

The credentials are be defined in the following format:
> [default]
> aws_access_key_id = 
> aws_secret_access_key = 

The [default] here is the profile name. We can specify multiple profiles for multiple AWS accounts in the same credentials file.

In the terraform script we can specify credentials as:
```
provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/path/to/file"
  profile                 = "profile_name"
}
```
This method is the preferred method for both production and testing.

