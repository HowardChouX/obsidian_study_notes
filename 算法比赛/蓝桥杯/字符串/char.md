
# char数组及操作


## 定义数组

```c++
//一维数组
char a[20];
cin.getline(a,19)//默认最后一个字符、\00

//二维数组
    char str[10][21];
    for(int i =0;i<10;i++){
        cin.getline(str[i],20);
            }
        }
    }
```

## 常用操作

### strcmp()比较

```c++
//strcmp
 for(int i=0;i<9;i++){

        for(int j =0;j<9-i;j++){

            if(strcmp(str[j],str[j+1])>0){//strcmp用于比较

                swap(str[j],str[j+1]);

            }

        }

    }
```


```c++
//strncmp
strncmp(str1, str2, 5); // 只比较前5个字符
```
### **核心功能**
- **短路比较**：在发现首个不同字符时立即返回结果

| 返回值    | 含义                     | 示例                               |
| ------ | ---------------------- | -------------------------------- |
| **<0** | `str1` 小于 `str2`（字典序前） | `strcmp("Apple", "Banana")` → 负数 |
| **=0** | 两字符串内容完全相同             | `strcmp("Hello", "Hello")` → 0   |
| **>0** | `str1` 大于 `str2`（字典序后） | `strcmp("Zebra", "Apple")` → 正数  |
## strcpy()赋值

```c+=
strcpy(str,"abcd")
```


## strcat(连接)
```c++
    for(int i=0;i<n-1;i++){

        for(int j=0;j<n-i-1;++j){

            strcpy(t1,s[j]);//赋值

            strcpy(t2,s[j+1]);

            strcat(t1,s[j+1]);//连接

            strcat(t2,s[j]);

            if(strcmp(t1,t2)<0){

                swap(s[j],s[j+1]);

            }

        }

    }
```

## strstr()位置

```c++
strstr("apple", "app"); // 找到（位置0
```