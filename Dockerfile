ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp

RUN gem install rails

WORKDIR /myapp

EXPOSE 3000