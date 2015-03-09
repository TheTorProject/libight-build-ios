#!/bin/sh -e

(
    cd libight
    test -f Makefile && make distclean
    git clean -dfx
)

rm -rf build/*
