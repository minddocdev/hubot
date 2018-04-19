# Hubot docker image

[![Build Status](https://travis-ci.org/mind-doc/hubot.svg?branch=master)](https://travis-ci.org/mind-doc/hubot)

Run hubot 3.0.x with Slack and Redis functionality in a docker container

## Build

```
$ docker build -t minddocdev/hubot .
```

## Run

```
$ docker run -d minddocdev/hubot
```

## Configuration

The following environment variables are required if you want to use all the initial functionality

### Slack adapter

* HUBOT_SLACK_TOKEN - Your Slack hubot integration API token

### Google Images

* HUBOT_GOOGLE_CSE_KEY - Your Google developer API key
* HUBOT_GOOGLE_CSE_ID - The ID of your Custom Search Engine
* HUBOT_MUSTACHIFY_URL - Optional. Allow you to use your own mustachify instance.
* HUBOT_GOOGLE_IMAGES_HEAR - Optional. If set, bot will respond to any line that begins with "image me" or "animate me" without needing to address the bot directly
* HUBOT_GOOGLE_SAFE_SEARCH - Optional. Search safety level.
* HUBOT_GOOGLE_IMAGES_FALLBACK - The URL to use when API fails. `{q}` will be replaced with the query string.

### Google Maps

* HUBOT_GOOGLE_API_KEY - Your maps API key ([how to get one](https://developers.google.com/maps/documentation/javascript/tutorial#api_key))

### Standup Alarm

* HUBOT_STANDUP_PREPEND - Optional. Defines a string that will be prepended to the alert messages Hubot sends. Typically, you'd use this to trigger an alert to everybody (like @channel).
* HUBOT_STANDUP_WEEKDAYS - Optional. Days the standup check fires on. It defaults to `1-5` (Monday-Friday)
