

FROM ubuntu:18.04 as base

ENV APP_DIR=/srv/app
WORKDIR $APP_DIR

USER root

RUN apt-get update --quiet=2 \
  && apt-get install --yes --no-install-recommends git ssh python-pip python-setuptools apt-transport-https wget curl zip gcc g++ make gnupg \
  && apt-get clean --yes

RUN curl -sL https://deb.nodesource.com/setup_12.x
RUN apt install nodejs --yes

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo \"deb https://dl.yarnpkg.com/debian/ stable main\" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && sudo apt-get install yarn


FROM base as node

ADD . $APP_DIR

RUN yarn install

