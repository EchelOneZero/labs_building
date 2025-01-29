#!/bin/sh

#
# Copyright (c) 2014-2024 Bjoern Kimminich & the OWASP Juice Shop contributors.
# SPDX-License-Identifier: MIT
#

# Exit on error
set -e

# Add docker key and repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo bash -c 'echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker-ce.list'


# Install apache and docker
sudo apt-get update -q
sudo apt-get upgrade -qy
sudo apt-get install -qy docker-ce

# Put the relevant files in place
# cp /tmp/bwapp/default.conf /etc/apache2/sites-available/000-default.conf

# Download and start docker image with Juice Shop
sudo docker run --restart=always -d -p 80:80 --name bwapp raesene/bwapp

# Enable proxy modules in apache and restart
# a2enmod proxy_http
# systemctl restart apache2.service
