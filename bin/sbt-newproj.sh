#!/bin/sh

echo "project name: $1"
echo "project package: $2/$1"

## typical directories
mkdir -p $1/src/main/scala/$2/$1
mkdir -p $1/src/test/scala/$2/$1

mkdir -p $1/project

## build.sbt
echo "name:=\"$1\"" >> $1/build.sbt
echo '\nversion:= "1.0"' >> $1/build.sbt
echo '\nscalaVersion:= "2.9.2"' >> $1/build.sbt
echo '\nlibraryDependencies += "com.twitter" %% "finagle-http" % "6.2.0"' >> $1/build.sbt
echo '\nlibraryDependencies += "junit" % "junit" % "4.11" % "test"' >> $1/build.sbt

## some plugins
echo 'addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.1.0")' >> $1/project/plugins.sbt
echo '\naddSbtPlugin("com.twc.thirdparty" %% "sbt-idea-twc" % "1.0")' >> $1/project/plugins.sbt

## git
echo "target/" >> $1/.gitignore
cd $1; git init

echo "project $1 created, maybe do something like:"
echo "cd tiger; sbt test"
