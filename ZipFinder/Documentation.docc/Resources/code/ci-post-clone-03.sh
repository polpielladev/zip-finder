#!/bin/sh

cd ..

if [ "$CI_WORKFLOW" == "Release iOS" ]; then
    brew install rbenv
    eval "$(rbenv init - --no-rehash zsh)"
fi
