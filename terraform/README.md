# Terraform Host

## Requirements
 * AWS account with terraform [IAM access](https://www.terraform.io/intro/getting-started/build.html).
 * Download the [Terraform executable](https://www.terraform.io/downloads.html) to this directory
 * Run `./terraform init` to download the AWS module
 * Edit the `aws-docker.tf` with the appropriate keys

## Generate SSH Keys
You need to generate a SSH keypair to use to provide authenticated access to the EC2 instance.

Change directory to the keys/ folder
  `cd keys/`

Now generate a keypair to use with the EC2 instance
  `ssh-keygen -t rsa -f id_rsa`

Change out of the keys folder
  `cd ..`

## Edit the Plan
Edit the `aws-docker.tf` and replace the keys on lines 2-3 with the AWS IAM credentials (Note: these credentials are sensitive so make sure you remove them).

Before running this plan make sure you have setup a [Docker Cloud](https://cloud.docker.com) account.

Click on `Nodes` and `Bring your own Node`.

Displayed will be a curl command something like
  `curl -Ls https://get.cloud.docker.com/ | sudo -H sh -s 232d2kewjsakjd2`

Edit line 24 in the `aws-docker.tf` with the key thats displayed on the web page.

## Building the host
Once the above edits are done you can now construct the EC2 instance.
  `./terraform apply`

At the end it should show the IP address of the host created. You can SSH to the host with the username ubuntu and the identity of keys/id_rsa

Confirm you see a node provisioning in the Docker Cloud nodes section.
