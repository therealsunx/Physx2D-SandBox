# SandBox for Physx2D library

Complete previous steps defined in [Physx-2D guide](https://github.com/therealsunx/Physx-2D) upto where you built and copied the physx2d library in "your import directory", in this case "external/". Here, Cmake is used for generating makefiles. Take a look at ***setup.sh*** and ***build.sh***.

- setup.sh contains script for setting up the project for development purpose, i.e. with debug feature available
- build.sh builds your program in the mode you specify in 2nd argument.

```
# in your project directory, i.e. inside physx2d-sandbox

./build.sh Debug
# builds the project in Debug Mode, with all logs available for development

./build.sh Release
# builds the project in Release Mode, with high performance, and no log-littering
```
