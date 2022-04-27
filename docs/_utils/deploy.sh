#!/bin/bash

# Copy contents
mkdir gh-pages
cp -r ./docs/_build/dirhtml/. gh-pages

# Create gh-pages branch
cd gh-pages
git init
git config --local user.email "contact@concord.chat"
git config --local user.name "GitHub Action"
git remote add origin "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git checkout -b gh-pages

# Deploy
git add .
git commit -m "Publish Docs" || true
git push origin gh-pages --force
