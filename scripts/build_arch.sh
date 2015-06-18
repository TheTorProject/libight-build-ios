#!/bin/sh -e

if [ $# -ne 2 ]; then
    echo "$0 platform arch" 1>&2
    echo "Example: $0 iPhoneSimulator i386"
    exit 1
fi

PLATFORM=$1
ARCH=$2

if [ "$PLATFORM" = "iPhoneOS" ]; then
    EXTRA_CONFIG="--host=arm-apple-darwin14 --target=arm-apple-darwin14"
fi

DEVELOPER=$(xcode-select -print-path)
REPOROOT=$(pwd)
MINIOSVERSION="6.1"
SDKVERSION="8.3"

export PATH="${DEVELOPER}/Toolchains/XcodeDefault.xctoolchain/usr/bin/:${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/usr/bin/:${DEVELOPER}/Toolchains/XcodeDefault.xctoolchain/usr/bin:${DEVELOPER}/usr/bin:${PATH}"

export CC="/usr/bin/gcc -arch ${ARCH} -miphoneos-version-min=${MINIOSVERSION}"
export CXX="/usr/bin/g++ -arch ${ARCH} -miphoneos-version-min=${MINIOSVERSION}"
export CPPFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk"
export CFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk"
export CXXFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk"

(
    cd measurement-kit
    test -x ./configure || autoreconf -i
    ./configure --disable-shared \
                --with-libevent=builtin \
                --with-libyaml-cpp=builtin \
                --with-libboost=builtin \
                --prefix=/ \
                $EXTRA_CONFIG
    make -j4
    make install V=0 DESTDIR=$REPOROOT/build/${PLATFORM}/${ARCH}
    make distclean
)
