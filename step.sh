#!/bin/bash
set -ex

#https://jeremylong.github.io/DependencyCheck/dependency-check-gradle/index.html must be setup on the project

###
# Dev purpose only
#export BITRISE_SOURCE_DIR="./"
#export source_root_path="./android"
#export BITRISE_DEPLOY_DIR="./deploy/"
#export android_target_name="app"
###

cd $source_root_path
#Run analyze
./gradlew :$android_target_name:dependencyCheckAggregate
cd $BITRISE_SOURCE_DIR
# Rename file to allow other dependency checker to be executed and stored in the artifact folder
mv $deploy_dir/dependency-check-report.html $deploy_dir/gradle-dependency-check-report.html