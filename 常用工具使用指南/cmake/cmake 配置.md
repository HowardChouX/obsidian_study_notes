### CMake 配置步骤

#### 1. 规范项目目录结构（关键！）

将文件按功能分类，避免混乱：

bash

```bash
.
├── CMakeLists.txt        # CMake 配置文件
├── include               # 存放头文件
│   └── hello.h          # 函数声明
└── src                   # 存放源文件
    ├── main.cpp         # 主程序
    └── hello.cpp        # 函数实现
```

#### 2. 编写 `hello.h` 和 `hello.cpp`

- ​**`include/hello.h`**​（声明）：
    
    cpp
    
    ```cpp
    [[ifndef]] HELLO_H
    [[define]] HELLO_H
    void hello();  // 必须与实现完全一致
    [[endif]]
    ```
    
- ​**`src/hello.cpp`**​（实现）：
    
    cpp
    
    ```cpp
    [[include]] "hello.h"
    [[include]] <iostream>
    void hello() {  // 注意函数名和参数匹配
        std==cout << "Hello from CMake!" << std==endl;
    }
    ```
    

#### 3. 编写 `CMakeLists.txt`

cmake

```cmake
cmake_minimum_required(VERSION 3.10)
project(HelloWorld)

# 设置C++标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 指定头文件搜索路径（关键！）
include_directories(${PROJECT_SOURCE_DIR}/include)

# 添加可执行文件，并链接所有源文件
add_executable(HelloWorld
    src/main.cpp
    src/hello.cpp    # 必须包含所有需要编译的.cpp文件
)

# 如果hello.cpp被编译为库，需额外链接（此处不需要）
# target_link_libraries(HelloWorld hello)
```

---

### 三、构建与编译流程

#### 1. 命令行操作

bash

```bash
# 在项目根目录执行
mkdir build   # 创建构建专用目录（隔离编译文件）
cd build
cmake ..      # 生成Makefile
make          # 编译并链接
./HelloWorld  # 运行程序
```

#### 2. VS Code 集成（自动化）

1. ​**安装 CMake Tools 扩展**：  
    https://i.imgur.com/4qgF6iD.png
2. 按 `Ctrl+Shift+P` 输入 `CMake: Configure`，选择编译器（如 GCC）。
3. 按 `F7` 或点击底部状态栏的 ​**Build** 按钮编译。
4. 按 `F5` 直接运行调试。

---

### 四、常见错误排查

#### 1. 若仍报 `undefined reference`

- ​**检查是否漏掉源文件**：  
    确保 `add_executable` 中包含了 `hello.cpp`。
- ​**检查头文件路径**：  
    如果头文件在嵌套目录（如 `include/utils`），需修改为：
    
    cmake
    
    ```cmake
    include_directories(${PROJECT_SOURCE_DIR}/include/utils)
    ```
    

#### 2. 若报 `找不到头文件`

- ​**绝对路径 vs 相对路径**：  
    在代码中正确引用头文件：
    
    cpp
    
    ```cpp
    [[include]] "hello.h"                  // 当头文件在 include/ 目录时
    [[include]] "subdir/hello.h"           // 当头文件在 include/subdir 时
    ```
    

#### 3. 若需要链接外部库

cmake

```cmake
# 假设需要链接数学库
target_link_libraries(HelloWorld m)
```

---

### 五、CMake 优势总结

1. ​**跨平台**：自动适配 Linux/Windows/macOS 的编译环境。
2. ​**依赖管理**：自动追踪头文件和源文件变化。
3. ​**灵活扩展**：支持模块化配置，轻松添加第三方库（如 OpenCV、Boost）。
4. ​**与 IDE 深度集成**：VS Code、CLion 等均可直接导入 CMake 项目。

---

### 六、最终项目结构验证

bash

```bash
（项目根目录）
├── CMakeLists.txt
├── include
│   └── hello.h
├── src
│   ├── hello.cpp
│   └── main.cpp
└── build          # 由CMake自动生成
    ├── HelloWorld # 最终的可执行文件
    ├── CMakeCache.txt
    └── Makefile
```