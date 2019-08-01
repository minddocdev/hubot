# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    hubot
# name:     minddocdev/hubot
# repo:     https://github.com/mind-doc/hubot
# Requires: node:alpine
# authors:  development@minddoc.com
# ------------------------------------------------------

FROM node:lts-alpine

LABEL maintainer="development@minddoc.com"

# Install hubot 3.x dependencies
RUN apk update\
 && apk upgrade\
 && apk add jq\
 && npm install -g yo generator-hubot@next\
 && rm -rf /var/cache/apk/*

# Create hubot user with privileges
RUN addgroup -g 501 hubot\
 && adduser -D -h /hubot -u 501 -G hubot hubot
ENV HOME /hubot
WORKDIR /hubot
RUN chown -R hubot:hubot .
USER hubot

# Install hubot
ENV HUBOT_NAME "robot"
ENV HUBOT_OWNER "MindDoc <development@minddoc.com>"
ENV HUBOT_DESCRIPTION "A robot may not harm humanity, or, by inaction, allow humanity to come to harm"
RUN yo hubot\
 --adapter=slack\
 --owner="$HUBOT_OWNER"\
 --name="$HUBOT_NAME"\
 --description="$HUBOT_DESCRIPTION"\
 --defaults

EXPOSE 80

COPY entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]

CMD ["--name", "$HUBOT_NAME", "--adapter", "slack"]
