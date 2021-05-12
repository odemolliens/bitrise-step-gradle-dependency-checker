#!/bin/bash
set -ex

#https://jeremylong.github.io/DependencyCheck/dependency-check-gradle/index.html must be setup on the project

###
# Dev purpose only
#export BITRISE_SOURCE_DIR="./"
#export source_root_path="./android"
#export generated_report_path="./build/gradle-security-report/"
#export BITRISE_DEPLOY_DIR="./deploy/"
#export android_target_name="app"
###

cd $source_root_path
#Run analyze
./gradlew :$android_target_name:dependencyCheckAggregate
cd $BITRISE_SOURCE_DIR
#Copy and zip results into /deploy/ folder
cp -R $generated_report_path $BITRISE_DEPLOY_DIR/gradle-audit-reports/
zip -r $BITRISE_DEPLOY_DIR/gradle-audit-reports.zip $BITRISE_DEPLOY_DIR/gradle-audit-reports/*