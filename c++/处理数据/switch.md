
# 基础语法结构

```c++
switch (表达式) {
    case 常量1:
        语句组1
        break;
    case 常量2:
        语句组2
        break;
    default:
        默认语句组
}
```

# 表达式限制
- 必须为整型（int, char, short等）或枚举类型
- 不支持浮点型、字符串等类型

# case 穿透现象

```c++
int num = 2;
switch(num) {
    case 1: cout << "A";
    case 2: cout << "B";  // 输出B
    case 3: cout << "C";  // 继续输出C（没有break）
    default: cout << "D"; // 继续输出D
}  // 最终输出BCD
```

## 枚举类型结合使用
```c++
enum Color{
RED,GREEN,BLUE};
Color c = GREEN;
switch(c)
{
	case RED: 
		cout << "危险";
		break;
	case GREEN:
		cout << "安全";
		break;
	case BLUE:
		cout << "注意";
		break;
	
}
```

## 状态机实现实例

```c++
int state = 0;
while(ture)
{
	switch(state)
	{
		case 0:
			state = 1;
			break;
		case 1:
			state = 2;
			break;
		case 2;
			return 0;
	}
}	
```