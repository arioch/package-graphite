#!/bin/sh

set -e

#PKG_VERSION='0.9.10'
PKG_VERSION=$1

if [ ! -f python-carbon_${PKG_VERSION}_all.deb ]
then
  wget http://launchpad.net/graphite/0.9/${PKG_VERSION}/+download/carbon-${PKG_VERSION}.tar.gz
  tar xvzf carbon-${PKG_VERSION}.tar.gz
  fpm --python-install-bin /opt/graphite/bin -s python -t deb carbon-${PKG_VERSION}/setup.py
  rm -rf carbon-${PKG_VERSION}.tar.gz
  rm -rf carbon-${PKG_VERSION}
fi

if [ ! -f python-graphite-web_${PKG_VERSION}_all.deb ]
then
  wget http://launchpad.net/graphite/0.9/${PKG_VERSION}/+download/graphite-web-${PKG_VERSION}.tar.gz
  tar xvzf graphite-web-${PKG_VERSION}.tar.gz
  fpm --python-install-lib /opt/graphite/webapp -s python -t deb graphite-web-${PKG_VERSION}/setup.py
  rm -rf graphite-web-${PKG_VERSION}.tar.gz
  rm -rf graphite-web-${PKG_VERSION}
fi

if [ ! -f python-whisper_${PKG_VERSION}_all.deb ]
then
  wget https://launchpad.net/graphite/0.9/${PKG_VERSION}/+download/whisper-${PKG_VERSION}.tar.gz
  tar xvzf whisper-${PKG_VERSION}.tar.gz
  fpm --python-install-lib /opt/graphite/bin -s python -t deb whisper-${PKG_VERSION}/setup.py
  rm -rf whisper-${PKG_VERSION}.tar.gz
  rm -rf whisper-${PKG_VERSION}
fi

if [ ! -f python-carbon-${PKG_VERSION}-1.noarch.rpm ]
then
  wget http://launchpad.net/graphite/0.9/${PKG_VERSION}/+download/carbon-${PKG_VERSION}.tar.gz
  tar xvzf carbon-${PKG_VERSION}.tar.gz
  fpm --python-install-bin /opt/graphite/bin -s python -t rpm carbon-${PKG_VERSION}/setup.py
  rm -rf carbon-${PKG_VERSION}.tar.gz
  rm -rf carbon-${PKG_VERSION}
fi

if [ ! -f python-graphite-web-${PKG_VERSION}-1.noarch.rpm ]
then
  wget http://launchpad.net/graphite/0.9/${PKG_VERSION}/+download/graphite-web-${PKG_VERSION}.tar.gz
  tar xvzf graphite-web-${PKG_VERSION}.tar.gz
  fpm --python-install-lib /opt/graphite/webapp -s python -t rpm graphite-web-${PKG_VERSION}/setup.py
  rm -rf graphite-web-${PKG_VERSION}.tar.gz
  rm -rf graphite-web-${PKG_VERSION}
fi

if [ ! -f python-whisper-${PKG_VERSION}-1.noarch.rpm ]
then
  wget https://launchpad.net/graphite/0.9/${PKG_VERSION}/+download/whisper-${PKG_VERSION}.tar.gz
  tar xvzf whisper-${PKG_VERSION}.tar.gz
  fpm --python-install-lib /opt/graphite/bin -s python -t rpm whisper-${PKG_VERSION}/setup.py
  rm -rf whisper-${PKG_VERSION}.tar.gz
  rm -rf whisper-${PKG_VERSION}
fi

