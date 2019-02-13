FROM alpine
MAINTAINER 'Simon Green'

ENV BUILD_PACKAGES curl wget bash curl-dev build-base postgresql-dev
ENV RUBY_PACKAGES ruby ruby-bigdecimal ruby-dev ruby-io-console ruby-bundler
ENV RAILS_ENV docker

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN bundle config --global frozen 1

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
