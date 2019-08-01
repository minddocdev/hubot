# Hubot docker image

[![Build Status](https://travis-ci.org/minddocdev/hubot.svg?branch=master)](https://travis-ci.org/mind-doc/hubot)

Lightweight alpine docker image that runs hubot 3.0.x with Slack.

## Configuration

The following environment variables should be provided if you want to use Hubot.

* HUBOT_SLACK_TOKEN - Required Slack hubot integration API token.
  See [hubot-slack documentation](https://slack.dev/hubot-slack/).
* HUBOT_NAME - Optional bot name.
  Defaults to `robot`.
* HUBOT_OWNER - Optional bot owner name.
  Defaults to `MindDoc <development@minddoc.com>`.
* HUBOT_DESCRIPTION - Optional bot description.
  Defaults to `A robot may not harm humanity, or, by inaction, allow humanity to come to harm`.
* EXTRA_PACKAGES - Optional comma-separated list of NPM packages, required by your scripts.

## Docker Hub

### `docker pull`

You can pull the image from Docker Hub using the `docker pull minddocdev/hubot` command.
We use [automated build set up](https://docs.docker.com/docker-hub/builds/#create-an-automated-build).

```sh
docker pull minddocdev/hubot
```

### `docker build`

You can also build the image yourself. Checkout the repository

```sh
git clone https://github.com/minddocdev/hubot
cd hubot
docker build -t minddocdev/hubot .
docker images minddocdev/hubot
```

### `docker run`

To jump into the container's `bash` shell

```sh
docker run -it minddocdev/hubot /bin/sh
```

#### With extra npm packages

Just define the `EXTRA_PACKAGES` environment variable.

```sh
docker run -ti -e EXTRA_PACKAGES=aws-sdk,cron minddocdev/hubot /bin/sh
```

#### With extra scripts

Mount `external-scripts.json` as a volume:

```sh
docker run -ti -v ${PWD}/external-scripts.json:/hubot/external-scripts.json minddocdev/hubot /bin/sh
```

## Links

* [Docker Hub `minddocdev/hubot`](https://hub.docker.com/r/minddocdev/flutter)
* [GitHub `minddocdev/hubot`](https://github.com/minddocdev/hubot)
* [decayofmind/hubot-docker](https://github.com/decayofmind/hubot-docker) (load scripts inspiration)
