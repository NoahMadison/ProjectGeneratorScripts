echo Select a langauge C, CPP, or CS:
read lang
echo Name of the project:
read name
touch premake5.lua

CPP1="workspace \"Workspace\"\n\tarchitecture \"x64\"\n\n\tconfigurations {\n\t\t\"Debug\",\n\t\t\"Release\"\n\t}\n\n\tstartproject \"$name\"\n\noutputdir = \"%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}\"\n\ninclude \"$name\"\n\nnewaction {\n\ttrigger = \"clean\",\n\tdescription = \"Remove all binaries and intermediate binaries, and vs files.\",\n\texecute = function()\n\t\tprint(\"Removing binaries\")\n\t\tos.rmdir(\"./bin\")\n\t\tprint(\"Removing intermediate binaries\")\n\t\tos.rmdir(\"./bin-int\")\n\t\tprint(\"Removing project files\")\n\t\tos.rmdir(\"./.vs\")\n\t\tos.remove(\"**.sln\")\n\t\tos.remove(\"**.vcxproj\")\n\t\tos.remove(\"**.vcxproj.filters\")\n\t\tos.remove(\"**.vcxproj.user\")\n\t\tprint(\"Done\")\n\tend\n}"
CPP2="project \"$name\"\n\tkind \"ConsoleApp\"\n\tlanguage \"C++\"\n\tcppdialect \"C++17\"\n\tstaticruntime \"on\"\n\n\ttargetdir(\"../bin/\" .. outputdir .. \"/%{prj.name}\")\n\tobjdir(\"../bin-int/\" .. outputdir .. \"/%{prj.name}\")\n\n\tfiles {\n\t\t\"src/**.cpp\",\n\t\t\"include/**.h\"\n\t}\n\n\tincludedirs {\n\t\t\"include\"\n\t}\n\n\tdefines {\n\t\t\"WINDOWS\"\n\t}\n\n\tfilter { \"configurations:Debug\" }\n\t\truntime \"Debug\"\n\t\tsymbols \"on\"\n\n\tfilter { \"configurations:Release\" }\n\t\truntime \"Release\"\n\t\toptimize \"on\""
C1="workspace \"Workspace\"\n\tarchitecture \"x64\"\n\n\tconfigurations {\n\t\t\"Debug\",\n\t\t\"Release\"\n\t}\n\n\tstartproject \"$name\"\n\noutputdir = \"%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}\"\n\ninclude \"$name\"\n\nnewaction {\n\ttrigger = \"clean\",\n\tdescription = \"Remove all binaries and intermediate binaries, and vs files.\",\n\texecute = function()\n\t\tprint(\"Removing binaries\")\n\t\tos.rmdir(\"./bin\")\n\t\tprint(\"Removing intermediate binaries\")\n\t\tos.rmdir(\"./bin-int\")\n\t\tprint(\"Removing project files\")\n\t\tos.rmdir(\"./.vs\")\n\t\tos.remove(\"**.sln\")\n\t\tos.remove(\"**.vcxproj\")\n\t\tos.remove(\"**.vcxproj.filters\")\n\t\tos.remove(\"**.vcxproj.user\")\n\t\tprint(\"Done\")\n\tend\n}"
C2="project \"$name\"\n\tkind \"ConsoleApp\"\n\tlanguage \"C\"\n\tcdialect \"C11\"\n\tstaticruntime \"on\"\n\n\ttargetdir(\"../bin/\" .. outputdir .. \"/%{prj.name}\")\n\tobjdir(\"../bin-int/\" .. outputdir .. \"/%{prj.name}\")\n\n\tfiles {\n\t\t\"src/**.c\",\n\t\t\"include/**.h\"\n\t}\n\n\tincludedirs {\n\t\t\"include\"\n\t}\n\n\tdefines {\n\t\t\"WINDOWS\"\n\t}\n\n\tfilter { \"configurations:Debug\" }\n\t\truntime \"Debug\"\n\t\tsymbols \"on\"\n\n\tfilter { \"configurations:Release\" }\n\t\truntime \"Release\"\n\t\toptimize \"on\""
CS1="workspace \"Workspace\"\n\tarchitecture \"x64\"\n\n\tconfigurations {\n\t\t\"Debug\",\n\t\t\"Release\"\n\t}\n\n\tstartproject \"$name\"\n\noutputdir = \"%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}\"\n\ninclude \"$name\"\n\nnewaction {\n\ttrigger = \"clean\",\n\tdescription = \"Remove all binaries and intermediate binaries, and vs files.\",\n\texecute = function()\n\t\tprint(\"Removing binaries\")\n\t\tos.rmdir(\"./bin\")\n\t\tprint(\"Removing intermediate binaries\")\n\t\tos.rmdir(\"./bin-int\")\n\t\tprint(\"Removing project files\")\n\t\tos.rmdir(\"./.vs\")\n\t\tos.remove(\"**.sln\")\n\t\tos.remove(\"**.vcxproj\")\n\t\tos.remove(\"**.vcxproj.filters\")\n\t\tos.remove(\"**.vcxproj.user\")\n\t\tprint(\"Done\")\n\tend\n}"
CS2="project \"$name\"\n\tkind \"ConsoleApp\"\n\tlanguage \"CS\"\n\tstaticruntime \"on\"\n\n\ttargetdir(\"../bin/\" .. outputdir .. \"/%{prj.name}\")\n\tobjdir(\"../bin-int/\" .. outputdir .. \"/%{prj.name}\")\n\n\tfiles {\n\t\t\"src/**.cs\",\n\t\t\"include/**.h\"\n\t}\n\n\tincludedirs {\n\t\t\"include\"\n\t}\n\n\tdefines {\n\t\t\"WINDOWS\"\n\t}\n\n\tfilter { \"configurations:Debug\" }\n\t\truntime \"Debug\"\n\t\tsymbols \"on\"\n\n\tfilter { \"configurations:Release\" }\n\t\truntime \"Release\"\n\t\toptimize \"on\""
mkdir $name
touch $name/premake5.lua
mkdir $name/src

if [ "$lang" = "CPP" ];
    then
    mkdir $name/include/MTd
    echo $CPP1 >> ./premake5.lua
    echo $CPP2 >> $name/premake5.lua
    touch $name/src/$name.cpp
    echo '#include <iostream>\n\nint main()\n{\n\tstd::cout << "Hello World!\\n";\n}' >> $name/src/$name.cpp
elif [ "$lang" = "C" ];
    then
    mkdir $name/include
    echo $C1 >> ./premake5.lua
    echo $C2 >> $name/premake5.lua
    touch $name/src/$name.c
    echo '#include <stdio.h>\n\nint main()\n{\n\tprintf("Hello World!\\n");\n}' >> $name/src/$name.c
elif [ "$lang" = "CS" ];
    then
    echo $CS1 >> ./premake5.lua
    echo $CS2 >> $name/premake5.lua
    touch $name/src/$name.cs
    echo "using System;\nnamespace $name\n{\n\tpublic static class Program\n\t{\n\t\tpublic static void Main(string[] args)\n\t\t{\n\t\t\tConsole.WriteLine(\"Hello, World!\");\n\t\t}\n\t}\n}" >> $name/src/$name.cs
fi
