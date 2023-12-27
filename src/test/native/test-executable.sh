#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

cd "$(dirname "$0")/../../.." || exit 1

OS=${2:-platform}
if [ "${OS}" = "macos" ]; then
    OS=darwin
    # the output can't be checked on macos
    exit 0
fi

ARCH=$(uname -m)
if [ "${ARCH}" = "arm64" ] && [ "${OS}" = "darwin" ]; then
    ARCH=aarch64
fi

expectedOutput="${1:-artifact} version \"${3:-revision}\""
executable="./target/gluonfx/${ARCH}-${OS}/${1:-artifact}"
actualOutput=$(${executable} --version)
if [ "$actualOutput" != "$expectedOutput" ]; then
    echo "The output is wrong. Expected:"
    echo "$expectedOutput"
    echo "Got:"
    echo "$actualOutput"
    exit 1
fi

# add custom tests here:
