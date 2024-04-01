# Project 4

## Part 1 - Dockerize it

***NOTE: For this project, there are two files. One is utilizing the `site.ta.gz` template that was given, and for more practice with simplicity, there is a second one called `myApp` that was used from the YouTube video listed in resources below that is just "Hello World"!***

### What are we doing? Why?

The purpose of this project is to integrate Docker into the CI/CD pipline and setting up enviorments for testing and creating docker images and containers.

We do this because it Docker enables developers to build, test, and manage package applications and helps users to achieve consistency, effeciency, and project management.

### How to Install Docker

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

### How to Build an Image from the Docker File

***NOTE: Make sure you have a directory already created, for me it is in the **site** directory and **myapp** directory with a **index.html** file and a file that contains another **.html** file that contains the contents of the website***

After cd'ing into the directory that contains the **html** files make sure to use these commands to build the image from the docker file:

1. `touch Dockerfile` to create the file
2. `vim Dockerfile` to open the text editor to input these items:

FROM nginx
COPY index.html /usr/share/ngix/htm

3. `docker build -t myapp .` starts the docker and build docker image from the dockerfile (-t will tag the image)

4. to view the built images, use the command `docker images`

### How to Run the Container

1. To run the container, use the command `docker run -d -p 8080:80 myapp`

2. to check if it is running, run `docker ps`

### How to View the Project Running

To make sure the project is running, you are able to access the app using the web.

1. go to the local web browser (for me it is safari or google chrome)
2. type in the search bar `https://localhost:8080` (the local host will be the IPv4 address from the system you are using)
3. After that is typed in, you should be able to see what was typed in your contents folder on the screen!

## Part 2 - GitHub Actions and DockerHub

### How to Create a Public Repo in DockerHub

1. Go to Docker Desktop (online or in the application) and sign in or create an account
2. Click *Create a Repository*
3. Give the Repo a Name! (It already has the namespace as your username!)
4. Give a short description of what this repo is for!
5. For this project, we are using a **Public** Repo
6. Click *Create*

### How to Authenticate

1. After opening your terminal, and connecting to the AWS Instance, type in `docker login`
2. it will then prompt you to enter your **username** and **password**
3. you will then be told **Login Succeeded**

### Push Container Image to DockerHub (Without GitHub Actions)

1. Make sure you are logged in to dockerhub on terminal instance
2. run `docker images` to see which one you would like to mess with
3. ***OPTIONAL*** Rename the image you would liked to use, I did if for simplicity, using the command `docker tag <image_id> <dockerhub_username>/<repository_name>:<tag>`
    - so for me, it was `docker tag 64987e5de400 kkoppin001 docker-repo-koppin:latest`
4. then `docker push kkoppin001/docker-repo-koppin:latest` to push the image to the repo
### Link to Public Docker Repo

`https://hub.docker.com/repository/docker/kkoppin001/docker-repo-koppin/general`


### What is a GitHub Secret?

A GitHub secret is a secure environment variable that you can store in your GitHub repository settings. It is encrypted and only accessible to authorized users with appropriate permissions, such as repository administrators.

### How to Set GitHub Secrets

1. Go to current GitHub Repository
2. Click on the **Settings** tab
3. In the side bar, click **Secrets and Variables**
4. Click **Actions**
5. Click **New Repository Secret**
6. Give it a name and put in your secret!
7. Click **Add Secret**
8. Then you can use them in your workflows!

### What Secrets are Used for this Specifically?

You are using repository secrets!

1. Docker Username
2. Docker Password

### What does a GitHub Workflow do and when?

**WHAT:** A GitHub Workflow is defined in a YAML file and is stored in the .github/workflows directory of your repository. This YAML file defines the jobs, steps, triggers, and other configurations for the workflow.

**WHEN:** A GitHub workflow starts when a specified event or trigger occurs like a push action within the GitHub repository.

### What Variables in Workflow are Custom to this Project?

- Trigger Events
- Jobs
- Steos
- Workflow Inputs
- Workflow Outputs
- Secrets


## Part 3 - Diagramming

### Image & Container Diagram

![IMG_0401](https://github.com/WSU-kduncan/s24cicd-kkoppin001/assets/116985839/ace1897a-1385-4957-a334-db742f2bb0e4)

### Connecting Docker Repo to GitHub Repo Diagram

![IMG_0403](https://github.com/WSU-kduncan/s24cicd-kkoppin001/assets/116985839/943e6695-2130-40d2-b771-b68ecad25b91)


### Creating A Workflow Diagram

![IMG_0402](https://github.com/WSU-kduncan/s24cicd-kkoppin001/assets/116985839/df214dbe-2377-4f69-adf9-8e090bfecee6)


## Resources Used

- [Youtube Video: Dockerfile > Docker Image > Docker Container](https://www.youtube.com/watch?si=zkZeHyWoM0JY8yaJ&v=C-bX86AgyiA&feature=youtu.be)
