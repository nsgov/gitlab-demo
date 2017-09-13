# gitlab-demo
GitLab Demo for Halifax DevOps Meetup

## Overview
This demo will be used to provision an EC2 instance on Amazon AWS. This instance is a medium size so it will fall outside the free tier on AWS!

Once the EC2 instance is setup it will be registered and managed via Docker Cloud for deploying of Stacks of software.

GitLab will be one stack of software comprised of gitlab-ce and gitlab-multi-runner. These two pieces of software will power the demo's code management and CI/CD platform.

SimpleWeb is another stack which will be a demo product created with a development and production hosting environment so we can see the CI/CD process in full with gated releases.

## Constructing a demo environment
* Use docker-cloud/README.md to create a docker-cloud account
* Use terraform/README.md to create an AWS EC2 instance to host the containers
* Use docker-cloud/README.md to create the software stacks
* Use gitlab-notes/README.md to setup the gitlab server and CI/CD
