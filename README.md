# gitlab-demo
GitLab Demo for Halifax DevOps Meetup

## Overview
This demo will be used to provision an EC2 instance on Amazon AWS. This instance is a medium size so it will fall outside the free tier on AWS!

Once the EC2 instance is setup it will be registered and managed via Docker Cloud for deploying of Stacks of software.

GitLab will be one stack of software comprised of gitlab-ce and gitlab-multi-runner. These two pieces of software will power the demo's code management and CI/CD platform.

SimpleWeb is another stack which will be a demo product created with a development and production hosting environment so we can see the CI/CD process in full with gated releases.

![service_overview](https://github.com/nsgov/gitlab-demo/raw/master/assets/service_overview.png)

## Constructing a demo environment
We have setup instructions starting from scratch using an AWS instance or if you have a host with Docker installed you can jump to registering it on Docker Cloud. We recommend using the Terraform starting point as it will keep the project in total isolation.

If you need a hosting box start at the Terraform instructions at
  [terraform/README.md](https://github.com/nsgov/gitlab-demo/blob/master/terraform/README.md#terraform-host)

If you wish to BYOD you can start at
  [docker-cloud/README.md](https://github.com/nsgov/gitlab-demo/tree/master/docker-cloud#docker-cloud-setup)
  
## CI/CD Changes
Once the demo project is setup you can see changes happen via the CI/CD. This is all controlled by the `.gitlab-ci.yml` file.

![ci_cd_overview](https://github.com/nsgov/gitlab-demo/raw/master/assets/ci_cd_overview.png)

### Pipeline
On a code change a Pipeline is started in GitLab. This pipeline will execute as many jobs defined in the Pipeline

### Jobs
On our sample yaml a pipeline will execute three jobs and will only process the next if the prior succeeded.

1. `Compile Webserver` a GoLang compile of the webserver code
2. `Build Dev Tag` Build a Docker container of the project as defined in the Dockerfile and tag the container as dev
3. `Build Latest Tag` Build a Docker container of the project as defined in Dockerfile and tag the container as latest

Note the third job has a conditional on it. `only - master` this means the job will only execute on the Master git branch.

### Simpleweb Stack
The simpleweb stack is setup to monitor the Docker registry and will auto reload the tagged container for the appropriate environment.
