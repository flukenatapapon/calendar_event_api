#!/usr/bin/env bash

echo "Running pre-commit hook for rubocop"
./hook/run-rubocop.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Code must be clean before commiting"
 exit 1
fi

echo "Running pre-commit hook for rspec"
./hook/run-rspec.bash

if [ $? -ne 0 ]; then
 echo "Tests must pass before pushing!"
 exit 1
fi