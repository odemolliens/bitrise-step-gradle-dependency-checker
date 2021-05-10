#!/bin/bash
set -ex

#https://jeremylong.github.io/DependencyCheck/dependency-check-gradle/index.html must be setup on the project


###
# Dev purpose only
#export BITRISE_SOURCE_DIR="./"
#export source_root_path="./android"
#export generated_report_path="./build/gradle-security-report/"
#export BITRISE_DEPLOY_DIR="./deploy/"
###

cd $source_root_path
./gradlew dependencyCheckAnalyze
cd $BITRISE_SOURCE_DIR
cp $source_root_path/$generated_report_path $BITRISE_DEPLOY_DIR
zip -r $BITRISE_DEPLOY_DIR/gradle-reports.zip $generated_report_path/*