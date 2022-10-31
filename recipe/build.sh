#!/bin/bash

go build -v -o $PREFIX/bin/go-licenses

go-licenses save . --save_path=./license-files
# TODO: remove if not actually needed, see #6
# rm -r ./license-files/github.com/google/licenseclassifier/licenses

# Make GOPATH directories writeable so conda-build can clean everything up.
find "$( go env GOPATH )" -type d -exec chmod +w {} \;
