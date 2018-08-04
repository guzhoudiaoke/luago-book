#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
./bin/luago ../lua/ch02/hello_world.lua | grep "Hello, World!"

# test java
cd ../java
gradle build
java -cp build/classes/java/main com.github.zxh0.luago.Main ../lua/ch02/hello_world.lua | grep "Hello, World!"

echo OK