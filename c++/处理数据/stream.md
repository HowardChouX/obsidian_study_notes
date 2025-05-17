```c++
// 1. cin/cout（类型安全流输入输出）
int num;
cin >> num;        // 读取到第一个非数字停止
cout << num;       // 自动类型转换

// 2. getchar/putchar（C风格字符输入输出）
char c = getchar(); // 读取任意字符（包括换行符）
putchar(c);         // 输出单个字符

// 3. getline（读取整行）
string s;
getline(cin, s);   // 读取直到换行符（自动丢弃换行符）
```