#!/bin/sh

cd ..

echo 'export GEM_HOME=$HOME/gems' >>~/.bash_profile
echo 'export PATH=$HOME/gems/bin:$PATH' >>~/.bash_profile
export GEM_HOME=$HOME/gems
export PATH="$GEM_HOME/bin:$PATH"

gem install bundler --install-dir $GEM_HOME

bundle install

if [ "$CI_WORKFLOW" == "Release iOS" ]; then
    bundle exec fastlane update_version_number_if_needed
fi
