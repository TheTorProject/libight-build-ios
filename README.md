# Building MeasurementKit for iOS

MeasurementKit is an experimental library that provides common functionalities
useful to implement open measurement tools on mobile platforms.

This repository contains the code to cross-compile MeasurementKit for iOS.

To build for iOS you need to have a MacOSX 10.9.5 or higher system
with Xcode installed (older systems may be able to compile it but
this has not been tested by us).

## How to clone the repository

To clone properly MeasurementKit repository, make sure that you specify the
`--recursive` command line flag, as in:

    git clone --recursive https://github.com/measurement-kit/measurement-kit-build-ios

Such flag tells git to clone not only the MeasurementKit repository, but also
the [submodules](http://git-scm.com/docs/git-submodule) contained therein.

Alternatively, once you have cloned the repository, you can checkout all
the submodules using:

    git submodule update --init --recursive

## How to build MeasurementKit for iOS

The repository contains empty frameworks for MeasurementKit and for
all its dependencies. You just need to run

    ./scripts/build.sh

to compile everything and fill all the empty framework directories
with static libraries for iPhoneOS and iPhoneSimulator as well as with
all the required headers. You can then copy these frameworks inside
you project and import them in Xcode to integrate with MeasurementKit.
