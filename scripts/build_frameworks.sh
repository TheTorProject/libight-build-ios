#!/bin/sh -e

rm -rf boost.framework/*
rm -rf event2.framework/*
rm -rf measurement_kit.framework/*
rm -rf yaml-cpp.framework/*

# XXX Copying x86 headers -- has this implications (e.g., config.h)?
for N in boost event2 measurement_kit yaml-cpp; do
    cp -Rp build/iPhoneSimulator/i386/include/$N $N.framework/Headers
done
if [ ! -d "libraries" ]; then
  mkdir libraries
fi

lipo -create -output boost.framework/boost \
  build/iPhoneOS/arm64/lib/libboost.a \
  build/iPhoneOS/armv7s/lib/libboost.a \
  build/iPhoneOS/armv7/lib/libboost.a \
  build/iPhoneSimulator/i386/lib/libboost.a \
  build/iPhoneSimulator/x86_64/lib/libboost.a

cp boost.framework/boost libraries/boost

lipo -create -output event2.framework/event2 \
  build/iPhoneOS/arm64/lib/libevent.a \
  build/iPhoneOS/armv7s/lib/libevent.a \
  build/iPhoneOS/armv7/lib/libevent.a \
  build/iPhoneSimulator/i386/lib/libevent.a \
  build/iPhoneSimulator/x86_64/lib/libevent.a

cp event2.framework/event2 libraries/event2

lipo -create -output event2_pthreads.framework/event2_pthreads \
  build/iPhoneOS/arm64/lib/libevent_pthreads.a \
  build/iPhoneOS/armv7s/lib/libevent_pthreads.a \
  build/iPhoneOS/armv7/lib/libevent_pthreads.a \
  build/iPhoneSimulator/i386/lib/libevent_pthreads.a \
  build/iPhoneSimulator/x86_64/lib/libevent_pthreads.a


cp event2_pthreads.framework/event2_pthreads libraries/event2_pthreads

lipo -create -output measurement_kit.framework/measurement_kit \
  build/iPhoneOS/arm64/lib/libmeasurement_kit.a \
  build/iPhoneOS/armv7s/lib/libmeasurement_kit.a \
  build/iPhoneOS/armv7/lib/libmeasurement_kit.a \
  build/iPhoneSimulator/i386/lib/libmeasurement_kit.a \
  build/iPhoneSimulator/x86_64/lib/libmeasurement_kit.a


cp measurement_kit.framework/measurement_kit libraries/measurement_kit

lipo -create -output yaml-cpp.framework/yaml-cpp \
  build/iPhoneOS/arm64/lib/libyaml-cpp.a \
  build/iPhoneOS/armv7s/lib/libyaml-cpp.a \
  build/iPhoneOS/armv7/lib/libyaml-cpp.a \
  build/iPhoneSimulator/i386/lib/libyaml-cpp.a \
  build/iPhoneSimulator/x86_64/lib/libyaml-cpp.a


cp yaml-cpp.framework/yaml-cpp libraries/yaml-cpp
