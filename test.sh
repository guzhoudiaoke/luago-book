#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
./bin/luago ../lua/ch19/examples.lua | grep "2018"

echo OK