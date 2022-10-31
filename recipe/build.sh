#!/bin/bash

if [[ "${target_platform}" == "osx-arm64" ]]; then
  go build -v -o $PREFIX/bin/go-licenses

  # Build for osx-64 as this can also be run in cross-compilation mode.
  GOARCH=amd64 go build -v -o go-licenses-native
  ./go-licenses-native save . --save_path=./license-files
else
  go install -v github.com/google/go-licenses
  go-licenses save . --save_path=./license-files
fi

# TODO: remove if not actually needed, see #6
# rm -r ./license-files/github.com/google/licenseclassifier/licenses

# Make GOPATH directories writeable so conda-build can clean everything up.
find "$( go env GOPATH )" -type d -exec chmod +w {} \;
