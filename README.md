# Terraform Bootstrap Infrastructure

This repository contains Terraform configurations for setting up the necessary infrastructure to manage Terraform state files. It includes an S3 bucket for storing state files and state locking via lock file.

## Project Structure

- **bootstrap**
  - **backend**
    - **modules**
      - **aws**
        - **s3**
          - `s3.tf`
          - `variables.tf`
    - `main.tf`
    - `terraform.tf`
    - `terraform.tfvars` (you will need to create this)
    - `variables.tf`
  - `Makefile`

## Purpose

The Terraform configuration sets up:
- An S3 bucket for storing Terraform state files.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.6.0 or later.
- AWS credentials configured in your environment (e.g., through `aws-vault exec ...`).

### Configuration

1. **Create a repository from this template**:

2. **Update Variables**:
    - create `terraform.tfvars` and set the appropriate values for your environment:
      ```hcl
      s3_bucket_name = "your-s3-bucket-name"
      aws_region = "your-aws-region"
      owner = "your-name"
      kms_alias_name = "alias/your-memorable-name"
      ```

3. **Initialize Terraform**:

    NB replace {profile-name} with your aws profile name before running aws-vault commands

        ```bash
        cd bootstrap/backend
        aws-vault exec {profile-name} -- terraform init
        ```

4. **Apply the Configuration**:
   
    NB replace {profile-name} with your aws profile name before running aws-vault commands

      ```bash
      aws-vault exec {profile-name} -- terraform validate
      aws-vault exec {profile-name} -- terraform plan
      aws-vault exec {profile-name} -- terraform apply -auto-approve
      ```

5. **Clean Up**:

    **Danger!**  This is for your reference but should only be done after any other terraform stack that relies on it has been removed.

    NB replace {profile-name} with your aws profile name before running aws-vault commands

      ```bash
      aws-vault exec {profile-name} -- terraform destroy
      ```

## File Descriptions

- **`s3.tf`**: Contains the configuration for creating an S3 bucket with encryption, versioning, and public access blocking.
- **`main.tf`**: Configures and applies the DynamoDB and S3 modules.
- **`terraform.tf`**: Specifies Terraform's version requirements and provider configurations.
- **`terraform.tfvars`**: Holds the variable values for the Terraform configuration.
- **`variables.tf`**: Defines the variables used across the Terraform configuration.

## Notes

- Ensure that your AWS credentials have the necessary permissions to create and manage S3 buckets.

## License

[The original project](https://github.com/Ayobami-00/terraform-bootstrap) is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. The project has been updated to remove the dynamodb dependencies and reference aws-vault.
