

### **暴力枚举（Brute Force，BF）**

**通俗理解**：  
就像你丢了钥匙，把家里所有钥匙一把一把试过去，直到找到能开锁的那把。  
**特点**：

- **无脑尝试**：不考虑任何优化，直接试遍所有可能性
- **适用场景**：密码破解（如4位数字密码）、简单排列组合问题
- **例子**：
    
    ```c++
#include <iostream>
#include <iomanip>
#include <string>

using namespace std;

void brute_force_password(const string& target) {
    for (int i = 0; i < 10000; ++i) {
        // 生成4位数字字符串，不足补零
        string guess = to_string(i);
        guess = string(4 - guess.length(), '0') + guess;
        
        if (guess == target) {
            cout << "密码是：" << guess << endl;
            return;
        }
    }
    cout << "未找到密码" << endl;
}

int main() {
    brute_force_password("0420"); // 测试用例
    return 0;
}
    ```
    

---

### **穷举算法（Exhaustive Search，ES）**

**通俗理解**：  
像酒店检查每个房间是否有人，从1楼到顶楼，每个门都敲一遍确认。  
**特点**：

- **系统性覆盖**：按规则遍历所有可能解
- **优化可能**：可通过数学约束剪枝（提前排除不可能的分支）
- **例子**：
    
    ```c++
#include <iostream>
#include <vector>

using namespace std;

void optimized_search() {
    vector<int> results;
    
    for (int num = 15; num <= 100; num += 15) { // 直接遍历15的倍数
        results.push_back(num);
    }

    cout << "能被3和5整除的数：";
    for (int num : results) {
        cout << num << " ";
    }
    cout << endl;
}

int main() {
    optimized_search();
    return 0;
}
    ```
    

---

### **核心区别对比**

| **特征**    | 暴力枚举（BF）     | 穷举算法（ES）          |
| --------- | ------------ | ----------------- |
| **思维方式**  | 无差别尝试        | 系统性遍历 + 可能剪枝      |
| **时间复杂度** | 通常更高（如O(n!)） | 可能优化到多项式级（如O(n²)） |
| **适用规模**  | 极小规模（n≤10）   | 中小规模（n≤20）        |
| **代码复杂度** | 简单（多层循环）     | 中等（需设计剪枝条件）       |
| **典型应用**  | 密码破解、全排列     | 数独求解、路径优化         |