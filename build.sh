#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <build_type>"
    echo "build_type: Debug or Release"
    exit 1
fi

BUILD_TYPE=$1
BUILD_DIR="build"

PLATFORM=$(uname -s)

mkdir -p $BUILD_DIR

if [ "$PLATFORM" = "Linux" ] || [ "$PLATFORM" = "Darwin" ]; then
    # For Linux or macOS
    # cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ..
    cmake -S . -B $BUILD_DIR -DCMAKE_BUILD_TYPE=$BUILD_TYPE -G "Unix Makefiles"
    make -C $BUILD_DIR
elif [[ "$PLATFORM" = *"MINGW64_NT"* ]] || [[ "$PLATFORM" = *"MSYS_NT"* ]]; then
    # For Windows using MSYS2 or similar
    #cmake -S . -B ./build -DCMAKE_BUILD_TYPE=$BUILD_TYPE -G "Visual Studio 17 2022"
    #msbuild "$BUILD_DIR/Physx-2D.sln" /p:Configuration=$BUILD_TYPE
    cmake -S . -B $BUILD_DIR -DCMAKE_BUILD_TYPE=$BUILD_TYPE -G "Ninja"
    ninja -C $BUILD_DIR
else
    echo "Unsupported platform: $PLATFORM"
    exit 1
fi

