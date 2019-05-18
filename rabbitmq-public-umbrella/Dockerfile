FROM elixir:1.8.1

## Install various software dependencies (setting debian non-interactive install mode to prevent warnings)
## - rsync is required to run "make source-dist" against rabbitmq-server-release source code.
## - zip is required to run "make -C packaging package-generic-unix ..." in rabbitmq-server-release source folder.
## - build-essential:native
## - dh-systemd
## - python-simplejson
## - xmlto
## - xsltproc
##   ... are required to run "make -C packaging package-deb ..." in rabbitmq-server-release source folder.

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
 && apt-get update \
 && apt-get install -y apt-utils dialog \
 && apt-get install -y rsync zip \
 && apt-get install -y build-essential:native dh-systemd python-simplejson \
 && apt-get install -y xmlto xsltproc 

## Install various erlang-related software dependencies
## - first, setup new apt-get sources and corresponding GPG signatures for rabbitmq and erlang-related packages
## - then install required software dependencies

RUN echo 'deb http://binaries.erlang-solutions.com/debian precise contrib' | tee -a /etc/apt/sources.list \
&& echo 'deb http://dl.bintray.com/rabbitmq/debian stretch erlang-21.x' | tee -a /etc/apt/sources.list \
&& wget -O - http://binaries.erlang-solutions.com/debian/erlang_solutions.asc | apt-key add -  \
&& wget -O - 'https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc' | apt-key add - \
&& apt-get update \
&& apt-get install -y erlang-nox erlang-dev erlang-src

RUN apt-get install --yes locales \
 && echo "en_US.UTF-8 UTF-8" >/etc/locale.gen \
 && locale-gen

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.en

RUN git clone https://github.com/rabbitmq/rabbitmq-public-umbrella.git /var/opt/rabbitmq-public-umbrella \
 && cd /var/opt/rabbitmq-public-umbrella \
 && make co
