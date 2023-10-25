#!/bin/bash

set -uex
ROOT=$(git rev-parse --show-toplevel)
VERSION=$1

gh release create \
    --title "Boost $VERSION" \
    --notes "https://sourceforge.net/projects/boost/files/boost/${VERSION}" \
    "$VERSION" "$ROOT/download/boost-mirror-$VERSION"/*
