# tse_dockerhost

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with tse_dockerhost](#setup)
    * [What tse_dockerhost affects](#what-tse_dockerhost-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tse_dockerhost](#beginning-with-tse_dockerhost)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module sets up a Ghost Blog on a Docker container.

## Module Description
This modules sets up docker, and creates a new container using the "Ghost" image from the Docker repository. It also forwards the necessary ports and adds the firewall rules.

## Setup

### What tse_dockerhost affects

* It creates a systemd service file to manage the container.
* Deploys the image from the Docker repository.
* Forward ports 80 and 2368 to the container and open the ports.

### Setup Requirements
For some reason, when deploying Docker, the static internal ip configuration is lost. If this happens to you, please pass an interface string variable to the class, so it does an ifup on it when the container is up.

### Beginning with tse_dockerhost

In the Enterprise Node Classifier, just assing the class to the group. Or puppet apply -t -e 'include tse_dockerhost'.

## Limitations
This has been tested on RHEL 7 only.

