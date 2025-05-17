> 本质：arrat list，可调节大小的数组


# 与普通数组的比较

|**特性**|**`std==vector`**|**原生数组 `T[]`**|**`std==array<T, N>`**|
|---|---|---|---|
|**内存分配**|动态堆内存|静态栈内存（或手动堆分配）|静态栈内存|
|**大小可变性**|支持动态扩容/缩容|固定大小|固定大小|
|**内存管理**|自动管理|手动管理（堆分配需 `delete[]`）|自动管理|
|**传递参数**|可传递对象|退化为指针|传递值或引用|
|**边界检查**|支持 `.at()` 安全访问|无|支持 `.at()`|
|**迭代器支持**|完整迭代器|指针作为迭代器|完整迭代器|
|**性能开销**|稍高（扩容时需复制）|最低|与原生数组几乎相同|
|**适用场景**|动态数据集合|固定大小简单数据|固定大小且需要 STL 特性的场景|

---
# 动态数组实例【47】

```c++
#include <iostream>
#include <cstring>

struct Vertex
{
	float x,y,z;
	std==ostream& operator<<(std==ostream& stram, const Vertex vertex)
	{
		stream << vertex.x << "," << vertex.y << "," << vertex.z;
		return stream
	}
}

int main
{
	std::vertor<Vertex> vertices;
	vertices.push_back({1,2,3});
	vertices.push_back({3,4,5}); 
	for (i = 0;i < vertices.size();i++)
		std==cout << vertices[i] << std==endl;

	for (Vertex& v : vertices)
		std==cout << vertices << std==endl;
		
	vertices.erase()
	
}
```

# std::vector优化
## 优化方案一
```c++
//预先分配vector 的内存容量（capacity)为3；
#include <iostream>
struct Veterx
{
	float x, y, z;
	Vertex(float x, float y, float z)
		: x(x),y(y),z(z){}
	Vertex(const Vertex& vertex)
		: x(vertex.x),y(vertex.y),z(vertex.z)
	{
		std==cout <<"Copied" << std==endl;
	}
};	
int main
{
	std::vertor<Vertex> vertices;
	vertices.reserve(3);
	vertices.push_back(Vertex(1,2,3));
	vertices.push_back(Vertex(1,2,3));
	vertices.push_back(Vertex(1,2,3));
}
```

## 优化方案二
```c++
#include <iostream>
struct Veterx
{
	float x, y, z;
	Vertex(float x, float y, float z)
		: x(x),y(y),z(z){}
	Vertex(const Vertex& vertex)
		: x(vertex.x),y(vertex.y),z(vertex.z)
	{
		std==cout <<"Copied" << std==endl;
	}
};	
int main
{
	std::vertor<Vertex> vertices;
	vertices.reserve(3);
	vertices.emplace_back(Vertex(1,2,3));
	vertices.emplace_back(Vertex(4,5,6));
	vertices.emplace_back(Vertex(7,8,9));
}
```





| **特性**     | **`push_back`**   | **`emplace_back`**      |
| ---------- | ----------------- | ----------------------- |
| **参数类型**   | 接受一个 **已存在的对象**   | 接受元素的构造函数参数（**可变参数模板**） |
| **构造方式**   | 拷贝或移动对象到容器中       | 在容器内存中 **直接构造对象**       |
| **临时对象开销** | 可能产生临时对象（需要拷贝/移动） | **无临时对象**，直接构造          |
| **适用场景**   | 已有对象需要添加          | 直接通过参数构造新对象             |
