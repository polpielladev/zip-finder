#!/bin/sh

brew install rbenv
eval "$(rbenv init - --no-rehash zsh)"
rbenv install 3.1.1
rbenv local 3.1.1

bundle install