FROM ruby:3.0.2

WORKDIR /log_auditor

RUN apt-get update -qq && rm -rf /var/lib/apt/lists/*


RUN gem install bundler
