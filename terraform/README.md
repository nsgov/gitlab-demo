# Terraform Host

## Requirements
 * AWS account with terraform [IAM access](https://www.terraform.io/intro/getting-started/build.html).
 * A [Docker Cloud](https://cloud.docker.com) account with the node information.
 * Download the [Terraform executable](https://www.terraform.io/downloads.html) to this directory

## Setup Terraform

### Initialize Terraform
We need to initialize Terraform to download any modules

 * Run `./terraform init`

### Generate SSH Keys
We will need a SSH keypair to use to provide authenticated access to the EC2 instance.

Change directory to the keys/ folder
  `cd keys/`

Now generate a keypair to use with the EC2 instance
  `ssh-keygen -t rsa -f id_rsa`

Change out of the keys folder
  `cd ..`

### Get a Docker Cloud key
We need to set the key 

Login to [Docker Cloud](https://cloud.docker.com)

* Click on `Nodes` and `Bring your own Node`.

Displayed will be a curl command something like
  `curl -Ls https://get.cloud.docker.com/ | sudo -H sh -s 232d2kewjsakjd2`

The hash at the end of the line is the node key.

### Customize the Plan
We need to set custom variables in the plan

* Edit the `aws-docker.tf`

* Replace the keys on lines 2-3 with the AWS IAM credentials (Note: these credentials are sensitive so make sure you remove them).

* Edit line 24 in the `aws-docker.tf` and replace the node key with the one from the Docker Cloud key.

## Building the host
Once the above edits are done you can now construct the EC2 instance.
  `./terraform apply`

At the end it should show the IP address of the host created. You can SSH to the host with the username ubuntu and the identity of keys/id_rsa.pub

## Next Steps
Now you're ready to deploy the GitLab stack to the server follow the [instructions here](https://github.com/nsgov/gitlab-demo/tree/master/docker-cloud#gitlab-stack)
