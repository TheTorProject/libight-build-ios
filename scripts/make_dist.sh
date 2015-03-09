#!/bin/sh -e

DESTDIR=dist
STEMS="libevent libight libyaml-cpp"

rm -rf dist/*
install -d dist/lib
for NAME in $STEMS; do
    for EXT in .a; do
        SOURCES=""
        for DIR in build/*/*/lib; do
            SOURCES="$SOURCES $DIR/$NAME$EXT"
        done
        lipo -create -output $DESTDIR/lib/$NAME$EXT $SOURCES
    done
done

cp -Rp build/iPhoneSimulator/i386/include dist/
