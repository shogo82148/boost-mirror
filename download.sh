#!/bin/bash

set -euxo pipefail

CURRENT=$(cd "$(dirname "$0")" && pwd)
VERSION=${1#v}

mkdir -p "$CURRENT/download/boost-mirror-$VERSION"
cd "$CURRENT/download/boost-mirror-$VERSION"

MAJOR=$(echo "$VERSION" | cut -d. -f1)
MINOR=$(echo "$VERSION" | cut -d. -f2)
PATCH=$(echo "$VERSION" | cut -d. -f3)

cd "$CURRENT/download/boost-mirror-$VERSION"

curl -f --retry 3 -LO "https://sourceforge.net/projects/boost/files/boost/${MAJOR}.${MINOR}.${PATCH}/boost_${MAJOR}_${MINOR}_${PATCH}.tar.gz" || \
    curl -f --retry 3 -LO "https://boostorg.jfrog.io/artifactory/main/release/${MAJOR}.${MINOR}.${PATCH}/source/boost_${MAJOR}_${MINOR}_${PATCH}.tar.gz" || \
    rm -f "boost_${MAJOR}_${MINOR}_${PATCH}.tar.gz"

curl -f --retry 3 -LO "https://sourceforge.net/projects/boost/files/boost/${MAJOR}.${MINOR}.${PATCH}/boost_${MAJOR}_${MINOR}_${PATCH}.zip" || \
    curl -f --retry 3 -LO "https://boostorg.jfrog.io/artifactory/main/release/${MAJOR}.${MINOR}.${PATCH}/source/boost_${MAJOR}_${MINOR}_${PATCH}.zip" || \
    rm -f "boost_${MAJOR}_${MINOR}_${PATCH}.zip"

curl -f --retry 3 -LO "https://sourceforge.net/projects/boost/files/boost/${MAJOR}.${MINOR}.${PATCH}/boost_${MAJOR}_${MINOR}_${PATCH}.tar.bz2" || \
    curl -f --retry 3 -LO "https://boostorg.jfrog.io/artifactory/main/release/${MAJOR}.${MINOR}.${PATCH}/source/boost_${MAJOR}_${MINOR}_${PATCH}.tar.bz2" || \
    rm -f "boost_${MAJOR}_${MINOR}_${PATCH}.tar.bz2"

curl -f --retry 3 -LO "https://sourceforge.net/projects/boost/files/boost/${MAJOR}.${MINOR}.${PATCH}/boost_${MAJOR}_${MINOR}_${PATCH}.7z" || \
    curl -f --retry 3 -LO "https://boostorg.jfrog.io/artifactory/main/release/${MAJOR}.${MINOR}.${PATCH}/source/boost_${MAJOR}_${MINOR}_${PATCH}.7z" || \
    rm -f "boost_${MAJOR}_${MINOR}_${PATCH}.7z"
