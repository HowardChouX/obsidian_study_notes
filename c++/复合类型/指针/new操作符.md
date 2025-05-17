```c++
[[include]] <iostream>
[[include]] <string>

using String = std::string;

class Entity
{
private:
    String m_Name;
public:
    Entity() : m_Name("Unknown") {}//默认构造函数
    Entity(const String& name) : m_Name(name) {}//带参数构造函数

    const String& GetName() const { return m_Name; }//常量函数

};

int main()
{
    int a = 2;//栈变量自动管理
    int* b = new int[50];//堆分配int数组

    Entity* e = new Entity();//分配单个对象
    delete e;//正确释放单个对象
    delete[] b;//正确释放数组


    std::cin.get();
}
```


```c++
Entity* e = new Entity[50];  // 分配对象数组
delete e;                    // ❌ 错误！应该用 delete[]
```

---

# new 操作符的的两种形式

| 形式   | 示例               | 内存布局              |
| ---- | ---------------- | ----------------- |
| 单个对象 | `new Entity`     | [对象1]             |
| 对象数组 | `new Entity[50]` | [数量][对象1][对象2]... |
