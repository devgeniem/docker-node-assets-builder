#!/bin/bash
##
# This script installs npm and builds webpack in all directories given as argument
##
if [[ $# -eq 0 ]] ; then
    echo "Usage: $0 /directory/to/install/npm/"
    exit 0
fi

for dir in "$@"
do

    # Go to directory
    if [ ! -d $dir ]; then
        echo "ERROR: $dir is not directory..."
        continue
    fi
    echo "Checking directory $dir"
    cd $dir

    # Install npm
    if [ -f package.json ];
    then
        echo "Running npm install..."
        npm install
    else
       echo "No package.json present, skipping..."
    fi

    # Install npm
    if [ -f ./node_modules/webpack/bin/webpack.js ];
    then
        # Run using included webpack
        echo "Running ./node_modules/webpack/bin/webpack.js..."
        ./node_modules/webpack/bin/webpack.js
    else
        echo "No local webpack.js present, skipping..."
    fi
done
