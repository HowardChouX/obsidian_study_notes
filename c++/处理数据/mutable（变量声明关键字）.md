> `mutable` 用于突破 `const` 成员函数的限制



# 用于突破常量成员函数的限制
```c++
#include <iostream>

class Entity
{
private:
	std::string m_Name;
	mutable int m_DebugCount = 0;//✔️ 可被 const 函数修改
public:
	const std::string& GetName() const
	{
		m_DebugCount++;
		//m_Name = 2;❌ 普通变量不能在 const 函数中修改
		return m_Name;


	 }
};
int main()
{
	const Entity e;
	e.GetName();
	std::cin.get();
	
}

```

# lambda 表达式中修改按值捕获的变量副本
```c++
[[include]] <iostream>  
  
int main()  
  
{  
    int x = 8;  
    auto f = [=]() mutable  
    {  
        x++;  
        std==cout << x << std==endl;  
    };  
  
    f();
    std::cout << x <<;  
}
```

```c++

//底层原理，编译器转换类似下列代码
class __Lambda_9d8s {
private:
    int x_copy;  // 按值捕获的副本
public:
    __Lambda_9d8s(int x) : x_copy(x) {}  // 捕获时初始化副本
    
    // mutable 使 operator() 变为非 const
    void operator()() {
        x_copy++;  // 允许修改成员变量
        std::cout << x_copy;
    }
};
```