# 文件作用域间的static

> **文件作用域的** `static` **变量**（即全局变量前加 `static`）就像一个「文件专属保险箱.

### 类比（假设有两个文件 `A.cpp`和 `B.cpp`）

```c++
// A.cpp
static int secret = 100; // 文件A的专属保险箱（A的private）；
```

```c++
// B.cpp
extern int secret; //在其它文件寻找secret ❌ 编译错误！B文件找不到这个保险箱
```

此时：

1.  `A.cpp` 中的 `secret` 是「带密码的保险箱」<br>—— 只有 `A.cpp` 内部的代码能访问它
    
2.  `B.cpp` 即使强行用 `extern` 声明，也**无法访问或修改**这个变量
    

### 对比（如果去掉 `static`）

```c++
// A.cpp
int publicVar = 100; // 公共保险箱（外部链接性）
```

```c++
// B.cpp
extern int publicVar; // ✅ 可以访问！
```

---

### 实际意义

> 这种设计可以避免**跨文件的命名冲突**。 两个 `counter` 互不干扰，就像两个公司各自有独立的「财务账本」。

```c++
// File1.cpp
static int counter = 0; // 文件1的计数器
```

```c++

// File2.cpp
static int counter = 0; // 文件2的计数器
```

---

### 替代推荐

> 在 C++ 中更推荐用**匿名命名空间**替代文件级 `static`： 这能更清晰地表达「仅限本文件使用」的语义

```c++
// A.cpp
namespace 
{ // 匿名命名空间
    int secret = 100; // 效果等同于 static
}
```

---

# 类的static成员

> 类的 `static` 成员具有特殊的属性和用法

### 静态成员变量

-   **类级别共享**：所有类实例共享同一份数据
    
-   **声明方式**：类内用 `static` 声明，类外需要单独定义，且必须初始化
    

```c++
class Student {
public:
    static int chalkCount; // 静态成员变量，公共粉笔盒（所有学生共享）
    
    void takeChalk()
    {
        if(chalkCount > 0) 
        {
            chalkCount--;
            cout << "拿走一支粉笔，还剩" << chalkCount << "支\n";
        }
    }
};

int Student::chalkCount = 10; // 初始有10支粉笔

int main() 
{
    Student xiaoming;
    Student xiaohong;
    
    xiaoming.takeChalk(); // 还剩9支（小明拿）
    xiaohong.takeChalk(); // 还剩8支（小红拿）
}
```

---

### 静态成员函数

-   **无 this 指针**：只能访问静态成员，不能访问普通成员
    
-   **调用方式**：可通过类名直接调用
    

```c++

class School {
public:
    static void postNotice(string msg) { // 静态成员函数，公共公告栏
        cout << "📢 最新公告：" << msg << endl;
    }
};

// 不需要创建学校对象，直接发公告
School::postNotice("明天停课一天"); //类名直接调用
```

#### 成员函数对变量的访问权限

| 函数类型 | 访问静态变量 | 访问非静态变量 | 调用方式 |
| --- | --- | --- | --- |
| **非静态函数** | ✅   | ✅   | 需要对象实例调用 |
| **静态函数** | ✅   | ❌   | 类名直接调用 |

-   非静态函数隐藏了 `this` 指针（如 `void func(Student* this)`）
    
-   静态函数没有 `this` 指针，如同普通全局函数（只是作用域在类内）
    

# 局部作用间的static

### 现实场景类比

```c++
void 售货机() 
{
    static int 库存 = 10;  // 静态库存（长期存在）
    int 临时货架 = 5;       // 普通变量（每次调用新建）
    
    库存--;
    临时货架--;
    cout << "库存：" << 库存 << " 临时货架：" << 临时货架;
}

// 第一次调用
售货机();  // 输出：库存：9 临时货架：4
// 第二次调用
售货机();  // 输出：库存：8 临时货架：4（临时货架每次都重置）
```

```c++
//单例类，只存在一个实的类
class Singleton
{

private:
	static Singleton* s_Instance;
public:
	static Singleton& Get() { return *s_Instance;}
	void Hello() {}
};

Singleton* Singleton::s_Instance = nullptr;



int main()
{
	Singleton::Get().Hello();
	std::cin.get();
}

```

```c++
class Singleton
{
public:
	static Singleton& Get() 
	
	{
		static Singleton instance;
		return instance;
	}
	
	void Hello() {}
};


int main()
{
	Singleton::Get().Hello();
	std::cin.get();
}


```

---

### 核心特性

| 特性  | 静态局部变量 | 普通局部变量 |
| --- | --- | --- |
| **初始化时机** | 首次执行时初始化一次 | 每次进入作用域都初始化 |
| **生命周期** | 程序运行期间持续存在 | 作用域结束即销毁 |
| **内存位置** | 数据段（全局区） | 栈内存 |
|     |     |     |