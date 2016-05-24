#!/bin/sh

VERSION="$(cat "$(dirname $0)/../VERSION")"
BASEDIR="/opt/ruby-${VERSION}"

sudo rm -rf "${BASEDIR}"
sudo mkdir -p "${BASEDIR}"
sudo chown "$(whoami):" "${BASEDIR}"

cd "${HOME}/ruby-build"
./bin/ruby-build -v "${VERSION}" "${BASEDIR}"
