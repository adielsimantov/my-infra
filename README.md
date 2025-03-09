# Terraform Pipeline for my-app

## Overview

This repository automates Terraform infrastructure deployment for my-app with AWS via OpenID Connect (OIDC).

## Pipeline Workflow

### Terraform Plan & Apply (Main.yml)

Triggered on every push to any branch, this workflow:

Checks out the repository.

Authenticates with AWS using OIDC.

Runs terraform init, validate and plan for changes reviewing.

If the push is to the main branch, it executes terraform apply with auto-approve flag to deploy infrastructure.


### Terraform Destroy (Destroy.yml)

Triggered manually via GitHub Actions → Run Workflow, this job:

Checks out the repository.

Inits and destroys the deployed infrastructure using terraform destroy (with auto-approve flag).


## Prerequisites

Ensure the following before using this pipeline:

AWS IAM role configured for OIDC authentication.

Terraform configurations stored in the terraform/ directory.

Properly defined Terraform backend and state management.


## Environment Variables


| Variable Name             | Type         | Description
| ----------------- | ---------------------|--------------------------------------------- |
| OIDC_AWS_ROLE |  Env var | OIDC AWS IAM role for authentication
| AWS_REGION |  Env var | AWS region where the ECR repository hosted

## Deployment

Running Terraform Plan & Apply

Push changes to any branch to trigger terraform plan.


Merge changes into main to trigger terraform apply.


Verify applied infrastructure in AWS.



### Destroying Infrastructure

Go to GitHub Actions → Terraform Destroy (on left panel) → Run Workflow manually from main branch.
