#!/bin/sh

VERSION="$(cat "$(dirname $0)/../VERSION")"
BASEDIR="/opt/ruby-${VERSION}"
RH_RELEASE="rpm -q --queryformat '%{VERSION}' redhat-release"
[ -z "${RH_RELEASE}" ] && RH_RELEASE="rpm -q --queryformat '%{VERSION}' centos-release" ||:

# We need FPM to build Ruby and don't want to have it inside the package
sudo rm -rf /tmp/ruby
rsync -a "${BASEDIR}/" /tmp/ruby/

"${BASEDIR}/bin/gem" install --no-rdoc --no-ri fpm

sudo ln -s "${BASEDIR}/bin/ruby" /usr/local/bin/ # required for find-deps to work without hacks
DEPS="$($(dirname $0)/find-deps /tmp/ruby )"

rm -f ruby${VERSION}-*.rpm
"${BASEDIR}/bin/fpm" -s dir -t rpm -C /tmp/ruby -n "ruby${VERSION}" --prefix "${BASEDIR}" --version "1.0" --iteration "el${RH_RELEASE}" ${DEPS}
