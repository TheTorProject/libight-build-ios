#!/bin/sh -e

rm -rf boost.framework/*
rm -rf event2.framework/*
rm -rf ight.framework/*
rm -rf yaml-cpp.framework/*

# XXX Copying x86 headers -- has this implications (e.g., config.h)?
for N in boost event2 ight yaml-cpp; do
    cp -Rp build/iPhoneSimulator/i386/include/$N $N.framework/Headers
done

lipo -create -output boost.framework/boost \
  build/iPhoneOS/arm64/lib/libboost.a \
  build/iPhoneOS/armv7s/lib/libboost.a \
  build/iPhoneOS/armv7/lib/libboost.a \
  build/iPhoneSimulator/i386/lib/libboost.a \
  build/iPhoneSimulator/x86_64/lib/libboost.a

lipo -create -output event2.framework/event2 \
  build/iPhoneOS/arm64/lib/libevent.a \
  build/iPhoneOS/armv7s/lib/libevent.a \
  build/iPhoneOS/armv7/lib/libevent.a \
  build/iPhoneSimulator/i386/lib/libevent.a \
  build/iPhoneSimulator/x86_64/lib/libevent.a

lipo -create -output event2_pthreads.framework/event2_pthreads \
  build/iPhoneOS/arm64/lib/libevent_pthreads.a \
  build/iPhoneOS/armv7s/lib/libevent_pthreads.a \
  build/iPhoneOS/armv7/lib/libevent_pthreads.a \
  build/iPhoneSimulator/i386/lib/libevent_pthreads.a \
  build/iPhoneSimulator/x86_64/lib/libevent_pthreads.a

lipo -create -output ight.framework/ight \
  build/iPhoneOS/arm64/lib/libight.a \
  build/iPhoneOS/armv7s/lib/libight.a \
  build/iPhoneOS/armv7/lib/libight.a \
  build/iPhoneSimulator/i386/lib/libight.a \
  build/iPhoneSimulator/x86_64/lib/libight.a

lipo -create -output yaml-cpp.framework/yaml-cpp \
  build/iPhoneOS/arm64/lib/libyaml-cpp.a \
  build/iPhoneOS/armv7s/lib/libyaml-cpp.a \
  build/iPhoneOS/armv7/lib/libyaml-cpp.a \
  build/iPhoneSimulator/i386/lib/libyaml-cpp.a \
  build/iPhoneSimulator/x86_64/lib/libyaml-cpp.a
