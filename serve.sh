#!/usr/bin/env bash

rm -rf _site/ .jekyll-cache
bundle exec jekyll serve --incremental --livereload --port 4321
