#!/bin/bash

# Setup from a clean environment. Can be used by an agent to install all dependencies needed on a node.
# The setup agent needs to run temporarily as a sudoer. -- SHOULD NOT BE A CONVENTIONAL AGENT --

sudo apt-get -y update
sudo apt-get -y upgrade

sudo adduser jenkins -p ${secrets.JenkinsPassword}

# Clean former installs of Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Clean install of Docker (From Docker tutorial)

# Add Docker's official GPG key:
sudo apt-get -y update
sudo apt-get -y install ca-certificates curl gnupg
sudo install -y -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

sudo usermod -aG docker jenkins

# # Here we pull all the images needed

sudo docker pull jenkins
sudo docker pull atlassian/jira

# Following lines for files that doesn't exist yet.
# sudo mv ./jenkins_docker_setup.sh /home/jenkins/
# sudo mv ./jira_docker_setup.sh /home/jenkins
# sudo su - jenkins -c "sh ./jenkins_docker_setup.sh"
# sudo su - jenkins -c "sh ./jira_docker_setup.sh"
