# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    hubot
# name:     minddocdev/hubot
# repo:     https://github.com/mind-doc/hubot
# Requires: node:alpine
# authors:  development@minddoc.com
# ------------------------------------------------------

FROM node:alpine
LABEL maintainer="development@minddoc.com"

# Install hubot 3.x dependencies
RUN apk update && apk upgrade \
  && apk add redis jq \
  && npm install -g yo generator-hubot@next \
  && rm -rf /var/cache/apk/*

# Create hubot user with privileges
RUN addgroup -g 501 hubot \
  && adduser -D -h /minddocbot -u 501 -G hubot hubot
ENV HOME /minddocbot
WORKDIR /minddocbot
RUN chown -R hubot:hubot .
USER hubot

# Install hubot
ENV HUBOT_NAME minddocbot
ARG HUBOT_OWNER="MindDoc <development@minddoc.com>"
ARG HUBOT_DESCRIPTION="A robot may not harm humanity, or, by inaction, allow humanity to come to harm"
RUN yo hubot --adapter=slack --owner="$HUBOT_OWNER" --name="$HUBOT_NAME" --description="$HUBOT_DESCRIPTION" --defaults
# Set up extra external scripts (what we consider "essentials")
COPY external-scripts.json ./
RUN npm install --save $(jq -c -r '.[]' external-scripts.json | tr '\n' ' ')

EXPOSE 80

# Set up mandatory environment variables defaults
ENTRYPOINT ["/bin/sh", "-c", "bin/hubot --name $HUBOT_NAME --adapter slack"]
