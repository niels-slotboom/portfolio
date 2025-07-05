#!/usr/bin/env bash

rm -rf _site/
bundle exec jekyll serve --incremental --livereload --port 4321
