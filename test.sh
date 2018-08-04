#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
bin/luago | grep hello

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main | grep hello

echo OK