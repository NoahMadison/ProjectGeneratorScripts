if [ X"$1" = X"" ];
then

echo "Enter 'build.bat action' where action is one of the following:\n"
echo   compile           Will generate make file then compile using the make file.
echo   clean             Remove all binaries and intermediate binaries and project files.
echo   codelite          Generate CodeLite project files
echo   gmake             Generate GNU makefiles for Linux
echo   vs2005            Generate Visual Studio 2005 project files
echo   vs2008            Generate Visual Studio 2008 project files
echo   vs2010            Generate Visual Studio 2010 project files
echo   vs2012            Generate Visual Studio 2012 project files
echo   vs2013            Generate Visual Studio 2013 project files
echo   vs2015            Generate Visual Studio 2015 project files
echo   vs2017            Generate Visual Studio 2017 project files
echo   vs2019            Generate Visual Studio 2019 project files
echo   vs2022            Generate Visual Studio 2022 project files
echo   xcode4            Generate Apple Xcode 4 project files


elif [ X"$1" = X"compile" ];
then
PreMake/premake5linux vs2022

set solutionFile="Workspace.sln"
msbuild /t:Build /p:Configuration=Debug /p:Platform=x64 %solutionFile%
else
PreMake/premake5linux $1

fi