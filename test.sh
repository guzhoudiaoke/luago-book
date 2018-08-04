#!/bin/sh
set -ex

cd code/go
export GOPATH=$PWD
go install luago
bin/luago 2>&1 | grep -q 'Hello, World!'

echo OK