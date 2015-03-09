#!/bin/sh -e

DESTDIR=dist
DIRS=""
STEMS="libevent libight libyaml-cpp"

DIRS="$DIRS build/iPhoneSimulator/i386/lib"
DIRS="$DIRS build/iPhoneSimulator/x86_64/lib"
DIRS="$DIRS build/iPhoneOS/armv7/lib"
DIRS="$DIRS build/iPhoneOS/armv7s/lib"
DIRS="$DIRS build/iPhoneOS/arm64/lib"

rm -rf dist/*
install -d dist/lib
for NAME in $STEMS; do
    for EXT in .a .dylib; do
        SOURCES=""
        for DIR in $(echo $DIRS); do
            SOURCES="$SOURCES $DIR/$NAME$EXT"
        done
        lipo -create -output $DESTDIR/lib/$NAME$EXT $SOURCES
    done
done

cp -Rp build/iPhoneSimulator/i386/include dist/
