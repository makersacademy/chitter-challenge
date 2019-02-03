FROM alpine

RUN apk update && apk upgrade
RUN apk add curl wget bash ruby-bundler
RUN apk add ruby=2.5.1
RUN rm -rf /var/cache/apk/*

RUN bundle config --global frozen 1

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
