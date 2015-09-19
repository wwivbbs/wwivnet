SET WORKSPACE=W:\wwivnet
SET BUILD_NUMBER=2112
pushd %WORKSPACE%
call %WORKSPACE%\scripts\build.cmd || echo "Build FAILED!"
popd

