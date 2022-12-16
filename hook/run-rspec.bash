#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running test suites"
# bundle exec rspec