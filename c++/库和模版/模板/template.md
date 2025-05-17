# 函数模板

```c++
template<typename T>
T max(T a, T b){
	return (a>b)?a:b;
}
cout << max<int>(5,10);
cout << max(3.14.2.71);
```

# 类模板
```c++
template<class T>
class Box{
private:
	T content;
public:
	void set(T newContent)
	{
	content = newContent;
	}
	T get(){
	return content;
	}
	Box<string> stirngBox;
	stringBox.set("hello Templates")
}
```