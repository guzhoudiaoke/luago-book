#!/bin/sh
set -ex

# test go
cd code/go
export GOPATH=$PWD
go install luago
./bin/luago ../lua/ch21/test.lua | tr -d '\n,' | grep -q "bcacbacabacbbacabc" 

echo OK