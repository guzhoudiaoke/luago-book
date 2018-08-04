#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
luac ../lua/ch06/sum.lua
bin/luago luac.out | grep 2550

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main ../go/luac.out | grep 2550

echo OK