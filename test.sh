#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
luac ../lua/ch13/test.lua
./bin/luago luac.out | tr -d '\n\t' | grep -F -q "true2falseDIV BY ZERO !falsearithmetic error!"

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main ../go/luac.out | tr -d '\n\t' | grep -F -q "true2.0falseDIV BY ZERO !falsearithmetic error!"

echo OK