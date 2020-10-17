#!/bin/sh
export VERSION=0.10.0
mkdir -p googlesheets
cd ../io.floodplain.googlesheets/
gradle shadowJar --info --stacktrace
cd ../floodplain-docker
cp ../io.floodplain.googlesheets/build/libs/io.floodplain.googlesheets.jar  ./googlesheets/
docker build -t floodplain/debezium-with-mongodb:${VERSION} .
 
docker push floodplain/debezium-with-mongodB:${VERSION}
