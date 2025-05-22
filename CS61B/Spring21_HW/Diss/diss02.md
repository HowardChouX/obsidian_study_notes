
---

### **1. 静态与作用域**  
**代码题**  
```java
public class Pokemon {
    public String name;
    public int level;
    public static String trainer = "Ash";
    public static int partySize = 0;

    public Pokemon(String name, int level) {
        this.name = name;
        this.level = level;
        this.partySize += 1; // 代码行 10
    }

    public static void main(String[] args) {
        Pokemon p = new Pokemon("Pikachu", 17);
        Pokemon j = new Pokemon("Jolteon", 99);
        System.out.println("Party size: " + Pokemon.partySize); 
        p.printStats(); 
        int level = 18;
        Pokemon.change(p, level); 
        p.printStats(); 
        Pokemon.trainer = "Ash";
        j.trainer = "Cynthia";
        p.printStats(); 
    }

    public static void change(Pokemon poke, int level) {
        poke.level = level; 
        level = 50; 
        poke = new Pokemon("Luxray", 1); 
        poke.trainer = "Team Rocket";
    }

    public void printStats() {
        System.out.println(name + " " + level + " " + trainer);
    }
}
```

**问题**  
(a) 写出 `main` 方法执行后的输出结果。  
(b) 代码行 28 设置 `level = 50`，这里的 `level` 指代的是？  
A. `Pokemon` 对象的实例变量  
B. `change` 方法的参数局部变量  
C. `main` 方法中的局部变量  
D. 其他（解释）  
(c) 如果在 `main` 方法末尾调用 `Pokemon.printStats()`，会发生什么？  

---

### **2. 数组循环移位**  
**题目**  
编写函数 `rotate`，输入数组 `A` 和整数 `k`，返回一个新数组，其元素向右循环移位 `k` 位（若 `k` 为负则向左移位）。移位后原数组 `A` 不变。  
示例：  
输入 `A = [0,1,2,3,4,5,6,7]`，`k = 12` → 输出 `[4,5,6,7,0,1,2,3]`  

- 提示% 非常有用（-11%8=-3）

**代码框架**  

```java
public static int[] rotate(int[] A, int k) {
    int rightShift = _______________________________; 
    if (_________________________) { 
    _____________________________________________; 
    } 
    int[] newArr = ____________________________________; 
    for (__________________________________________) { 
        int newIndex = ________________________________;
         _____________________________________________; } 
    return newArr; 
    }
```



---

### **3. 双向链表图绘制**  
**题目**  
根据以下代码绘制 `DLLStringNode` 对象的盒指针图（类似双向链表结构）：  
```java
public class DLLStringNode {
    DLLStringNode prev;
    String s;
    DLLStringNode next;
    
    public DLLStringNode(DLLStringNode prev, String s, DLLStringNode next) { 
        /* 构造函数 */ 
        this.prev = prev;
        this.s = s;
        this.next = next;
    }

    public static void main(String[] args) {
        DLLStringNode L = new DLLStringNode(null, "eat", null);
        L = new DLLStringNode(null, "bananas", L);
        L = new DLLStringNode(null, "never", L);
        L = new DLLStringNode(null, "sometimes", L);
        DLLStringNode M = L.next;
        DLLStringNode R = new DLLStringNode(null, "shredded", null);
        R = new DLLStringNode(null, "wheat", R);
        R.next.next = R;
        M.next.next.next = R.next;
        L.next.next = L.next.next.next;
    }
}
```

---

### **4. 网格填充（Gridify）**  
**题目**  
实现 `SLList` 类的 `gridify` 方法，将链表元素按行优先顺序填充到 `rows×cols` 二维数组中。若元素不足，剩余位置填 0；若元素过多，忽略多余元素。  
i![[Pasted image 20250522142806.png]]
**代码框架**  
```java
public class SLList { 
    Node sentinel;
    public SLList() { 
        this.sentinel = new Node();
    } 
    
    private static class Node { 
        int item; 10 Node next; 
    }
    
    public int[][] gridify(int rows, int cols) { 
        int[][] grid = __________________________________;
        _________________________________________________;
        return grid;
    }
    
    private void gridifyHelper(int[][] grid, Node curr, int numFilled) {
        if (_________________________________________________________________________) {  
            return;
        }
        
        int row = ________________________________________;
        int col = ________________________________________;
        grid[row][col] = _____________________________;
        _________________________________________________;
    }
}
```

**问题**  
(a) 补全代码中的填空部分。  
(b) 为什么需要辅助方法 `gridifyHelper`？能否直接在 `gridify` 方法中完成逻辑？  

---

### **答案格式要求**  
- 代码题需写出修正后的完整代码或填空答案。  
- 简答题需明确标注选项或解释原因。  
- 链表图需用箭头和方框清晰表示节点关系。