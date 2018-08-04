#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
luac ../lua/ch11/vector2.lua
./bin/luago luac.out | tr -d '\n' | grep -F -q "[1, 2][3, 4][2, 4][3, 6]5falsetrue[3, 6]"

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main ../go/luac.out | tr -d '\n' | grep -F -q "[1, 2][3, 4][2, 4][3, 6]5.0falsetrue[3, 6]"

echo OK