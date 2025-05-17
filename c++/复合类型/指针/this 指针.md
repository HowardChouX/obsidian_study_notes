> 本质：this指针直接存储着当前对象的内存地址。this == &对象
> 有多个对象时谁调用就指向谁，因为每个对象都有独立的内存空间


---


## 成员变量消除歧义

```c++
class Student 
{
    string name;
public:
    void setName(string name) 
    {
        this->name = name;  // 左侧是成员，右侧是参数
    }

	//等价于
	student (string name)
		: name(name){}

};
```

---

## 链式调用
```c++
class Car 
{
    int speed = 0;
public:
    Car& accelerate()  // 返回对象自身
    {   speed += 10;
        return *this;   // 返回当前对象
    }
    
    void showSpeed() 
    {
        std::cout << speed;
    }
};

// 使用：
Car myCar;
myCar.accelerate().accelerate().showSpeed(); // 输出20
// 每次accelerate()都返回自己，像流水线一样连续操作
```

---




# 自销毁操作（慎用）


```c++
[[include]] <iostream>

class Entity; // 前置声明

void PrintEntity(const Entity& e); // 声明与定义一致

class Entity 
{
public:
    int x, y;

    // 正确初始化 + 移除危险操作
    Entity(int x, int y)    
    {
        this-> x = x;
        this->y = y;
        PrintEntity(*this); 
        //delete this;//❌ 极度危险操作！立即崩溃
    }

    // 补全返回值
    int GetX() const 
    {
        return x;
    }
};

// 正确定义
void PrintEntity(const Entity& e) {
    std::cout << "Entity(" << e.x << ", " << e.y << ")\n";
}

int main() {
    Entity e(5, 8); // 安全使用
    return 0;
}
```



## 删除this（自己）在栈上建立立即崩溃
![[Pasted image 20250319151926.png]]
- 若对象在栈上创建：立即崩溃（delete栈内存非法）
- 若对象在堆上创建：导致悬空指针   