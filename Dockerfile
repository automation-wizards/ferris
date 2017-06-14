FROM ruby:2.4.0-alpine

RUN apk update && apk add build-base
RUN mkdir /app
WORKDIR /app

COPY . .
RUN bundle install -j 20
