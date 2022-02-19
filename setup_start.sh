#!/bin/bash
# 
# Use this file to setup the environment for Jenkins
# and run the server

# Variables
JENKINS_DOMAIN=<your domain> # this domain should be the name of your nginx configuration file as well
NGINX_SSL_EMAIL=<your email>

# Installing neccessary dependencies
sudo apt-get update -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    nginx \
    certbot

apt-get install -y python3-certbot-nginx

# Setup NGINX
sudo mkdir -p /var/log/nginx/jenkins
sudo cp $JENKINS_DOMAIN /etc/nginx/sites-available/$JENKINS_DOMAIN
sudo ln -s /etc/nginx/sites-available/$JENKINS_DOMAIN /etc/nginx/sites-enabled/

# SSL
sudo certbot --nginx -d $JENKINS_DOMAIN --non-interactive --agree-tos -m $NGINX_SSL_EMAIL

# Reload
nginx -t && nginx -s reload

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Setup the stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

# Start Docker and orchestrate
docker-compose up -d