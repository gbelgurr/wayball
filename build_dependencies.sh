#!/usr/bin/env bash
rm -rf bin

# Reliable way to get current script path
# Taken from https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH

# Setup the build folders
mkdir -p bin
mkdir -p bin/INSTALL
mkdir -p bin/INSTALL/include
mkdir -p bin/INSTALL/lib
mkdir -p bin/glfw
mkdir -p bin/glad

# Compile glfw
cmake -S $SCRIPTPATH/thirdparty/glfw -B $SCRIPTPATH/bin/glfw -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$SCRIPTPATH/bin/INSTALL -DCMAKE_BUILD_TYPE=Debug -DGLFW_BUILD_WAYLAND=1

cd $SCRIPTPATH/bin/glfw
make VERBOSE=1
make install
cd $SCRIPTPATH

# Compile glad
cmake -S $SCRIPTPATH/thirdparty/glad -B $SCRIPTPATH/bin/glad -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$SCRIPTPATH/bin/INSTALL -DCMAKE_BUILD_TYPE=Debug

cd $SCRIPTPATH/bin/glad
make VERBOSE=1
cp -v libglad.so $SCRIPTPATH/bin/INSTALL/lib
cp -R -v include $SCRIPTPATH/bin/INSTALL
cd $SCRIPTPATH


