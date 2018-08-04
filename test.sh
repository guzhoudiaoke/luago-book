#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
luac ../lua/ch02/hello_world.lua
bin/luago luac.out | grep LOADK

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main ../go/luac.out | grep LOADK

echo OK