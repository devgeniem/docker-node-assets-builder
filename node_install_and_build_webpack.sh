#!/bin/bash

# Rename variables
dir=$1

# Go to directory
cd $dir

# Install npm
npm install

# Run included webpack
./node_modules/webpack/bin/webpack.js
