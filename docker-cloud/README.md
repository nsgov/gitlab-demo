# Docker Cloud setup

## Create an account
Register for a new account at https://cloud.docker.com

If it defaults you to Swarm Beta turn it off

* Click on "Nodes"

* Click on "Bring your own node"

Make note of the registration hash and proceed to the [Terraform setup](https://github.com/nsgov/gitlab-demo/tree/master/terraform#setup-terraform).

Note: Make sure you have a node adopted in the Docker Cloud > Node section before proceeding

## GitLab Stack

### Create a stack
Once you have a node registered in Docker Cloud you will need to compose a stack to host the GitLab service

A stack is comprised of many services in this case the GitLab CE - app and
the GitLab Multirunner - runner.

Login to [Docker Cloud](https://cloud.docker.com)

* Click on `Stacks`

* Click on `Create`

* For a name enter `GitLab`

* For the YML drag and drop in the gitlab-stack.yml or paste it's content.

* Click on `Create` (Note: don't click on Create & Deploy)

Now the stack should be created

### Configure stack
Once you create the stack you need to edit the CHANGE_TO_SERVICE_ENDPOINT in the setup.

You can find the correct endpoint by
 * Click on `Stacks`
 * Click on `GitLab`
Then looking under `Endpoint sections` for app tcp/80

It will have some address http://app.gitlab.HASH.svc.dockerapp.io:80 copy the address before
:80.

* Click on "Edit" in the top right of GitLab stack
* Replace `CHANGE_TO_SERVICE_ENDPOINT` with this entry on `Line 4` and `Line 16`

For example:

  http://app.gitlab.1deb51ec.svc.dockerapp.io:80

The line 4 would look like:

```
      - "GITLAB_OMNIBUS_CONFIG=external_url 'http://app.gitlab.1deb51ec.svc.dockerapp.io/';"
```

Once line's 4 / 16 have been updated

* Click on `Save`

Now we're ready to start the stack

* Click on `Start`

The GitLab engine should be accessible in 2-3mins. Continue on to [GitLab Notes](https://github.com/nsgov/gitlab-demo/tree/master/gitlab-notes#gitlab-notes)

## SimpleWeb Stack

### Create a stack
Once you have a node registered in Docker Cloud (the terraform should do it) you
will need to compose a stack to host the demo Website service

A stack is comprised of two services in this case the prod and
dev. Each side of the stack follows the Docker Tags and will update when a new container is
pushed to the Docker Hub.

Login to [Docker Cloud](https://cloud.docker.com)

* Click on `Stacks`

* Click on `Create`

* For a name enter `SimpleWeb`

* For the YML drag and drop in the simpleweb-stack.yml or paste it's content.

* Modify lines 3 and 10 to the correct Docker Hub repository you setup earlier

* Click on `Create & Deploy`

Now the website should be accessible in the app endpoint. Note we've deployed two endpoints one for development usage and one for production
