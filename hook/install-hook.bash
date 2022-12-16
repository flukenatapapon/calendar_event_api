#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks..."
# this command creates symlink to our pre-commit script
if [ ! -f $GIT_DIR/hooks/pre-commit ]; then
  ln -s ../../hook/pre-commit.bash $GIT_DIR/hooks/pre-commit
fi
echo "Done!"