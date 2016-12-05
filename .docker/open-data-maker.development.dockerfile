FROM 18fgsa/docker-ruby-ubuntu:latest

RUN mkdir /open-data-maker

WORKDIR /open-data-maker

ENV BUNDLE_PATH /box
