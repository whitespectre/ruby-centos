#!/bin/sh

VERSION="$(cat "$(dirname $0)/VERSION")"

vagrant up
vagrant ssh -c '/vagrant/scripts/install-ruby-build.sh'
vagrant ssh -c '/vagrant/scripts/build-ruby.sh'
vagrant ssh -c '/vagrant/scripts/build-package.sh'
vagrant ssh -c "mv -f ruby${VERSION}*.rpm /vagrant/"
#vagrant destroy -f
