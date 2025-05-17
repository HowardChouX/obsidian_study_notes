# 文件分布概览


![[Pasted image 20250328144937.png]]



# container文件夹



## devcontainer.json


```json
{

    "name": "C++ WSL Container",

    "build": {

      "dockerfile": "Dockerfile",

      "context": ".."

    },

    "settings": {

      "C_Cpp.default.cppStandard": "c++17"

    },

    "extensions": [

      "ms-vscode.cpptools",

      "ms-vscode.cmake-tools"

    ],

    "remoteUser": "root"  

}
```


## Dockerfile

```Dockerfile
FROM gcc:latest

# 安装编译工具和依赖

RUN apt-get update && \

    apt-get install -y build-essential gdb g++ cmake git curl

# 设置工作目录

WORKDIR /workspace
```
# .vscode 文件夹（gdb)
## launch.json

```json
{

    "version": "0.2.0",

    "configurations": [

        {

            "name": "(gdb) 启动",

            "type": "cppdbg",

            "request": "launch",

            "program": "${workspaceFolder}/type/res/${fileBasenameNoExtension}",//中间为项目文件相对于根目录的位置

            "args": [],

            "stopAtEntry": false,

            "cwd": "${fileDirname}",

            "environment": [],

            "externalConsole": false,

            "MIMode": "gdb",

            "setupCommands": [

                {

                    "description": "为 gdb 启用整齐打印",

                    "text": "-enable-pretty-printing",

                    "ignoreFailures": true

                },

                {

                    "description": "将反汇编风格设置为 Intel",

                    "text": "-gdb-set disassembly-flavor intel",

                    "ignoreFailures": true

                }

            ]

        },

        {

            "name": "C/C++: g++ 构建和调试活动文件",

            "type": "cppdbg",

            "request": "launch",

            "program": "${workspaceFolder}/type/res/${fileBasenameNoExtension}",

            "args": [],

            "stopAtEntry": false,

            "cwd": "${fileDirname}",

            "environment": [],

            "externalConsole": false,

            "MIMode": "gdb",

            "setupCommands": [

                {

                    "description": "为 gdb 启用整齐打印",

                    "text": "-enable-pretty-printing",

                    "ignoreFailures": true

                },

                {

                    "description": "将反汇编风格设置为 Intel",

                    "text": "-gdb-set disassembly-flavor intel",

                    "ignoreFailures": true

                }

            ],

            "preLaunchTask": "C/C++: g++ build active file",

            "miDebuggerPath": "gdb"

        }

    ]

}
```

## task.josn

```josn
{

    "version": "2.0.0",

    "tasks": [

        {

            "type": "cppbuild",

            "label": "C/C++: g++ build active file",

            "command": "g++",

            "args": [

                "-g",

                "${file}",  // 当前文件（如 main.cpp）

                "-o",

                "${workspaceFolder}/type/res/${fileBasenameNoExtension}"  // 输出到 type/res 文件夹

            ],

            "options": {

                "cwd": "${fileDirname}"

            },

            "problemMatcher": ["$gcc"],

            "group": {

                "kind": "build",

                "isDefault": true

            }

        }

    ]

}
```