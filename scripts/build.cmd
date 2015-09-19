@rem **************************************************************************
@rem WWIVnet Build Script.
@rem
@rem Required Variables:
@rem WORKSPACE - git root directory
@rem BUILD_NUMBER - Jenkins Build number
@rem
@rem Installed Software:
@rem   7-Zip [C:\Program Files\7-Zip\7z.exe]
@rem 
@rem **************************************************************************

setlocal

set ZIP_EXE="C:\Program Files\7-Zip\7z.exe"
set RELEASE_ZIP=%WORKSPACE%\wwivnet-%BUILD_NUMBER%.zip
echo Workspace:     %WORKSPACE%         
echo Build Number:  %BUILD_NUMBER%
echo Archive:       %RELEASE_ZIP%

echo * Ensuring the staging area exists.
cd %WORKSPACE%\
if not exist %WORKSPACE%\release (
  echo Creating %WORKSPACE\release
  mkdir %WORKSPACE%\release
)
del /q %WORKSPACE%\release
del wwivnet-*.zip

cd %WORKSPACE%\
echo:
echo * Copying network files to staging directory.
copy /v/y %WORKSPACE%\wwivnet\* %WORKSPACE%\release\

echo:
echo * Creating build.nfo file
echo Build URL %BUILD_URL% > release\build.nfo
echo WWIVnet Build: %BUILD_NUMBER% >> release\build.nfo

echo:
echo * Creating release archive: %RELEASE_ZIP%
cd %WORKSPACE%\release
%ZIP_EXE% a -tzip -y %RELEASE_ZIP%

echo:
echo:
echo: **** SUCCESS ****
echo:
echo ** Archive File: %RELEASE_ZIP%
echo ** Archive contents:
%ZIP_EXE% l %RELEASE_ZIP%
endlocal

