# Project Documentation

## Part 1 - Semantic Versioning

### CD Project Overview

This project is creating a CD (a continuous delivery) pipeline that automates a process that facilitate the continuous delivery of software updates from development to production environments.

### How to generate a tag in GitHub

1. Go to the repository that you are currently working in
2. Go to the **Realeses Section**
3. click **Create a New Release**
4. Fill in the information
    - This is ewhere a new tag can be created and you would fill out the other information
5. Publich Release

### Behavior of this GitHub Workflow

The behavior of the workflow is supposed to be when the workflow is done, it will build a docker image and the push it to the docker repo

### Link to Docker Hub Repo

`https://hub.docker.com/repository/docker/kkoppin001/docker-repo-koppin/general`

## Part 2 - Deployment

### How to Install Docker on to your Instance

After conneceting to or your AWS instance, use these commands in this order to install Docker to your system using the terminal.

1. `sudo apt update` this will ensure that the packages index is up to date
2. `sudo apt install apt-transport-https ca-certificates curl software-properties-common` this will install necessary dependencies to allow use of a repository over HTTPS
3. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -` Add Docker’s official GPG key to ensure the packages you download are from Docker’s official repository:
4. `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"` Add the Docker repository to your system's software repository list
5. `sudo apt update` update the package index again now that the Docker repository has been added
6. `sudo apt install docker-ce` to install Docker engine
7. `docker --version` to verify that Docker Engine has been installed correctly by running the following command, which should output Docker version information
8. `docker  info` will tell the user whether or not docker is running
9. if docker is not running. use the command `sudo service docker start`
10. run step 8 again to check again

### Pull and Run Docker Image

**PULL:** `docker pull kkoppin001/docker-repo-koppin:v.1`
**RUN:** `docker run -d kkoppin001/docker-repo-koppin:v.1`


### Container Restart Script
**In GitHub Repo under `deploy.sh`**

### What does the Script do? Where is it?

The script pulls the latest image, stops and removed the existing container with the specific name, and then runs a new container with the latest image.

The deploy script should be in the same repository as the application you are wanting to run

### How to Install Webhook to the Instance and Use it

1. use the command `vim hooks.json`
2. input the information you would like for your hooks as long as you are making sure the spacing and the syntax is correct
3. run the command `sudo apt install webhook` so you can now use the command `webhook`
4. the run `webhook -hooks hook.json -verbose` to see the webhook is up and running the container and deploy script


### Webhook Task Definition File
#### Description of What it Does

This webhook is loading the hooks from the file task description and is then serving hooks on this link when ran

`https://34.238.45.41:9000/hooks/pedantic_volhard` 

#### Where it should be on the Instance

It should be in the same repository as the CI/CD pipeline projects

### How to configure GitHub to message the listener

1. go to repository
2. go to repo settings
3. click `webhooks`
4. click `create a new webhook`
5. input the `url link` and click what `trigger events` you would like to have
5. click `add webhook`

### Proof Link

[Yotube Video Proof](https://youtu.be/HBYCJo64GyY)

## Diagramming

<img width="1512" alt="Screenshot 2024-04-19 at 3 32 41 PM" src="https://github.com/WSU-kduncan/s24cicd-kkoppin001/assets/116985839/b2be524b-9f1d-433f-8fb6-4bad32c5a5e7">


## Resources
- [Effortless CI/CD](https://www.youtube.com/watch?v=OjRevvZvWX4&t=608s)
- [GitHub Actions Tutorial](https://www.youtube.com/watch?v=R8_veQiYBjI)
- [Build CI/CD Pipeline](https://www.youtube.com/watch?v=euEkYEFCrI8&t=410s)
- [Continuous Deployment](https://levelup.gitconnected.com/automated-deployment-using-docker-github-actions-and-webhooks-54018fc12e32)




