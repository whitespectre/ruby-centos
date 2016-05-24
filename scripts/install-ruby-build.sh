#!/bin/sh

sudo yum install -y git gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel xz-devel rpm-build
[ -d ruby-build ] || git clone https://github.com/rbenv/ruby-build.git
