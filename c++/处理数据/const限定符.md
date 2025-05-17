## 声明常量


```c++
const int MAX_AGE = 90;//声明常量MAX_AGE；

int* ptr = new int;//在堆上分配一个 int 类型的空间，并让 ptr 指向它

*ptr= 2;//通过指针修改 ptr 指向的内存的值


ptr = (int*)&MAX_AGE;//强制制类型转换，将 ptr 指向 MAX_AGE（⚠️ 不安全）

std==cout << *ptr << std==endl;
```
---


## 常量指针
> 指向常量数据的指针，不能通过指针修改数据，但指针本身可以指向其他变量。
```c++
const int* ptr; //ptr 是一个指向 const int 的指针。不能修改ptr指向的值，但 ptr可以指向其他地址。
// 或者 int const* ptr;

const int a = 10;
const int b = 20;
const int* ptr = &a;  // ✅ 允许：指针指向 a
*ptr = 15;         // ❌ 错误：不能修改 a 的值
ptr = &b;           // ✅ 允许：指向 b
std::cout << *ptr;  // 输出 20
```

---

## 指针常量
> 指针本身是常量，即 不能修改指针的地址,但可以修改它指向的值。
```c++ 
int* const ptr =&a //ptr 是一个const指针，不能修改ptr地址可修改指向变量的值
int a = 10;
int b = 20;
int* const ptr = &a;  // ✅ 允许：ptr 绑定到 a
*ptr = 15;            // ✅ 允许：修改 a 的值
// ptr = &b;         // ❌ 错误：不能修改 ptr 指向的地址
std::cout << a;       // 输出 15

```

---

## 常量指针常量
> 既不能修改指针指向的值，也不能修改指针的地址

| 类型                                  | 语法示例                    | 是否能修改值（`*ptr`） | 是否能修改指针（`ptr = &b`） |
| ----------------------------------- | ----------------------- | -------------- | ------------------- |
| **常量指针** (Pointer to Const)         | `const int* ptr;`       | ❌ 不允许          | ✅ 允许                |
| **指针常量** (Const Pointer)            | `int* const ptr = &a;`  | ✅ 允许           | ❌ 不允许               |
| **常量指针常量** (Const Pointer to Const) | `const int* const ptr;` | ❌ 不允许          | ❌ 不允许               |
### 根据*位置总结
- `const` 在 `*` **左边**：指向的是**常量**，不能修改 `*ptr`（指向的值不可变）。
- `const` 在 `*` **右边**：指针**本身是常量**，不能修改 `ptr`（地址不可变）。
- 两边都有 `const`：**既不能改值，也不能改地址**。
---
### 常量成员函数

```c++
class Entity
{
private:
	int m_X,m_Y;
	mutable int var;// 在 const 成员函数中可修改
public:
	int GetX() const
	{
		var = 2;
		return m_X;
	}
		void SetX(int x)
	{
		m_X = x;
	}
};
void PrintEntity(const Entity& e)//复制
{
	std==cout << e.GetX() << std==endl;
}

int main()
{
	Entity e;
}
```

- 常量成员函数 (`const` member functions) 用于定义不会修改类的非静态成员变量的方法。  
- `GetX()` 是一个常量成员函数，表示它不会修改类的成员变量 `m_X` 和 `m_Y`。  
- `SetX(int x)` 不是常量成员函数，因为它会修改成员变量 `m_X`。  
- 常量成员函数可以在常量对象上调用，例如 `PrintEntity(const Entity& e)` 中的 `e.GetX()`。  
- 常量成员函数不能调用非常量成员函数，也不能修改类的非静态成员变量。  
- 常量成员函数的定义通常以 `const` 关键字结尾。  
- 常量成员函数适用于需要保证数据不变的场景，例如在 `const` 对象上调用。