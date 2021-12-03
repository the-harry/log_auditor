FROM ruby:3.0.2

WORKDIR /log_auditor

RUN apt-get update -qq && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install
