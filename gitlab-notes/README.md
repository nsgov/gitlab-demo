# GitLab Notes

Assumes the [Docker Cloud GitLab](https://github.com/nsgov/gitlab-demo/tree/master/docker-cloud#gitlab-stack) stack has been started. If not please review the steps.

## Initialization
We need to wait for 2-3mins for the interface to load

* Set a password for the root account on the GitLab interface


## Runner Bootstrap
We need to attach the gitlab-multi-runner to the GitLab server once it's up. To complete
this perform the following steps:

Go to [docker-cloud](https://cloud.docker.com)

* Click on `runner` under the Service option

* Click on the `runner-1` container

* Click on `Terminal`

* Type in `$register` at the # prompt

This will complete registering the runner with the GitLab server

Verify by logging into the GitLab server

* Click on `Wrench` icon

* Click on `Runners`

You should see a runner registered with the name of the container from Docker Cloud for example runner-1

## Project Setup
Now that we have a GitLab server and a CI/CD engine running (the runner), let's setup a workspace for a sample project to build.

### Setup a Group
Login to the GitLab server

* Click on `+` and select `New group`

* In the Group Path enter `demo`

* Select the Visibility Level of `Internal`

* Click on `Create group`

### Setup a Project
Now in the demo group let's setup the workspace

* Click on `New Project`

* Click on `Repo by URL` from `Import project from`

* Type in `https://github.com/nsgov/gitlab-demo` for the `Git repository URL`

Confirm the namespace is set to `demo`

* In Project Name change the name to `simpleweb`

* Select the Visibility Level of `Internal`

* Click on `Create project`


### Setup Docker Hub registry
As a part of the CI/CD pipeline we need a repository to push the built Docker containers to so lets create that now

Login at [Docker Hub](https://hub.docker.com/)

* Click on `Create Repository +`

* In the name use `simpleweb`

* Set the Visibility to `public`

* Click on `Create`


### Confirm the Docker Hub CI/CD settings
We need to add the hub.docker.com password to the project so it can push Docker containers 

* Click on the `Settings` tab

* Click on `Pipelines`

Under "Secret variables" look for the Add a variable section

* Enter `DOCKER_PASS` in the Key

* Enter your hub.docker.com password in the "Value" section.

* Click on `Add new variable`

Let's also confirm any other account specific settings.

* Click on `Repository` on the top bar

* Click on the `.gitlab-ci.yml` file

* Click on `Edit`

Confirm your username matches line 4

Confirm your hub.docker.com registry name matches line 5

* Once everything looks ok click on `Commit changes`

## Monitor the pipeline
Login to GitLab website

* Click on the Project

* Click on the `Pipelines` tab

* Click on the `number` in the Pipeline column


## Setup the SimpleWeb stack
Visit the [docker-cloud/README.md](https://github.com/nsgov/gitlab-demo/tree/master/docker-cloud#simpleweb-stack) and see the section about SimpleWeb Stack
