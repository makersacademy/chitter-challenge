FROM alpine

RUN apk update && apk upgrade
RUN apk add curl wget bash curl-dev ruby-dev build-base postgresql-dev
RUN apk add ruby ruby-io-console ruby-bundler
RUN rm -rf /var/cache/apk/*

RUN bundle config --global frozen 1

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
