#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
cd ../lua/ch20
../../go/bin/luago test.lua | tr -d '\n' | grep -q "foobar"

echo OK