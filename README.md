# Wayball
Sample GL application using Wayland backend. This uses EGL to setup the context via the GLFW library.

# Building and Run
Clone the repository using the `--recursive` flag to download thirdparty dependencies like glad, glfw, etc.

```
git clone --recursive git@github.com:gbelgurr/wayball.git
```

### Building Dependencies

Run the bash script to build all the dependencies. Building dependencies may require cmake, make, etc to be installed.

```
./build_dependencies.sh
```

This should create a new `bin` folder in the project directory with all the binaries of the dependencies.
To rebuild the dependencies, just rerun the `build_dependencies.sh` script again.

### Building Wayball application

Once the dependencies are built, build the Wayball app,

```
make -j8
```

### Running Wayball

To run the Wayball app, use the following command

```
make run
```

### Cleaning the build

This removes any object files and already built Wayball app in the project directory.

```
make clean
```
