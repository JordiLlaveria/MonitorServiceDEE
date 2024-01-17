# Monitor service

## Table of Contents

1. [Drone Engineering Ecosystem](#drone-engineering-ecosystem)
2. [Functionality](#functionality)
3. [Topics monitored](#topics-monitored)
4. [Docker](#docker)
5. [PreCommit](#precommit)
6. [Example and tutorials](#example-and-tutorials)

# Drone Engineering Ecosystem
![software-arch](https://github.com/dronsEETAC/DroneEngineeringEcosystemDEE/assets/100842082/bee5f6cb-6057-4d92-8675-e1ace06e882f)

## Functionality

This module is responsible for monitoring the different communications exchanged between services through both internal and external broker.

The idea behind its development is having an intermediate service that allows to know which messages are being sent and if everything is working as expected.

## Topics monitored

__External broker:__ monitors any communication made through the topic __"autopilotService/#"__

__Internal broker:__ monitors any communication made through any topic, mainly the ones made between onboard services

## Docker

This service, once used in production mode, needs to be executed inside a Docker container, as is shown in the representation of the Drone Engineering Ecosystem. Because of that, when any modification is made to it, there's a need to generate a new image, and upload it to Docker Hub.

The way of generating a new image of it is:

```
docker build --platform linux/arm64/v8 -t “Docker Hub username”/”image name”:”version” .
```

Being an example:

```
docker build --platform linux/arm64/v8 -t jordillaveria/monitor_arm64:v2 .
```

__Once this image is created__, it can be found inside the Docker Desktop application, and at this moment, it can be pushed into Docker Hub repository, in order to be available for download from the RPi:

```
docker push “Docker Hub username”/”image name”:”versión”
```

## PreCommit

`pre-commit` is a pretty nice tool that allow us to run different actions in our code before we commit any file.
We will use it for formatting our code, "prettify" json files, etc. To install pre-commit on our code,
which will allow us to NOT commit the files if there is something wrong with them, we have to type on the top directory:

`pre-commit install`

If the pre-commit gets a little annoying, and you just want to commit files, you can deactivate it:

`pre-commit uninstall`

If we want to make sure that we can commit the files, and if not, why, then we need to run the following command:

`pre-commit run --all-files` or `pre-commit run -a`

By doing so, we ensure that, before uploading any file to GitHub, our code is well assembled.


## Example and tutorials

The basics of MQTT can be found here:
[MQTT](https://www.youtube.com/watch?v=EIxdz-2rhLs)

This is a good example to start using MQTT (using a public broker):
[Example](https://www.youtube.com/watch?v=kuyCd53AOtg)
