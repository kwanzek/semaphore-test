

FROM ubuntu:18.04 as base

ENV APP_DIR=/srv/app
WORKDIR $APP_DIR

USER root

RUN apt-get update --quiet=2 \
  && apt-get install --yes --no-install-recommends git ssh python-pip python-setuptools apt-transport-https wget curl zip gcc g++ make \
  && apt-get clean --yes

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN apt-get -y install nodejs



FROM base as node

ADD . $APP_DIR

RUN npm install

