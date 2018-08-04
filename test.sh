#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
bin/luago | grep "2.0"

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main | grep "2.0"

echo OK