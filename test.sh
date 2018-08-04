#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago

# test java
cd ../java
gradle build

echo OK