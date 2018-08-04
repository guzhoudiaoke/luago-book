#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
luac ../lua/ch10/test.lua
bin/luago luac.out | tr -d '\n' | grep 12132

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main ../go/luac.out | tr -d '\n' | grep 12132

echo OK