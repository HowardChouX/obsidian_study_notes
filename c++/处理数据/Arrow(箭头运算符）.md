
# 调用成员（常规用法）

```c++
class Entity
{
public:
	void Print()
	{
		std==cout << "Hello" << std==endl;
	}
	
}

int main（
{
	//对象访问成员
	Entity entity;
	entity.Print();
	
	//->指针访问成员
	Entity* ptr = &e;
	ptr->Print();//等价于（*ptr）.Print()

}
```

# -> 箭头重载（作用域指针）

```c++
//->箭头重载，作用域指针

#include <iostream>


class Entity
{
public:
    int x;
public:
    void Print() const 
    {
        std==cout << "Hello " << std==endl; 
    }
};
class ScopedPtr//作用域指针
{
private:
    Entity* m_Obj;
public:
    ScopedPtr(Entity* entity)
        : m_Obj(entity)
    {
    }
    ~ScopedPtr()
    {
        delete m_Obj;
    }
    //重载箭头操作符；
    Entity* operator->()
    {
        return m_Obj;// 返回原始指针，编译器会继续应用箭头操作符到返回的指针 
    }
    const Entity* operator->() const// 返回const指针，保证const对象只能调用const方法
    {
        return m_Obj;
    }

};
int main()
{
    const ScopedPtr entity = new Entity();//将new创建的堆内存所有权转交给智能指针,该内存的生命周期与智能指针对象绑定
    entity->Print();// 实际8调用链：entity.operator->()->Print();
}
```

# 获取偏移量

```c++
#include <iostream>
struct Vector3
{
	float x, y, z;

};
int main()
{
	int offest = (int)&((Vector3*)nullptr)->z;
	std==cout << offest << std==endl;//x为0，y为4，z为8
}
```