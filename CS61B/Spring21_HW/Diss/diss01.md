#### **. 题目背景**

CS61B 课程团队正在完善课程管理系统，需你协助实现 `CS61B` 类。需基于以下已提供的 `CS61BStudent` 学生类完成功能：

```java
public class CS61BStudent { 
    public int idNumber;     // 学号（实例变量）
    public int grade;        // 成绩 
    public static String instructor = "Hug"; // 讲师（静态变量）

    public CS61BStudent(int id) { // 构造函数
        this.idNumber = id;
        this.grade = 100;         // 初始成绩为 100
    }

    /** 实例方法：学生观看讲座（返回是否实际观看） */
    public boolean watchLecture() { ... }

    /** 静态方法：获取当前讲师 */
    public static String getInstructor() { ... }
}
```

---

#### **2. 实现要求**

##### **(a) 变量声明（a部分 ）**

在 `CS61B` 类中声明以下变量：

1. **`university`**
    - 所有 `CS61B` 课程实例的所属大学名称，固定为 `"UC Berkeley"`
    - 类型需确保所有学期共享同一值
2. **`semester`**
    - 当前课程实例对应的学期（如 `"Fall 2023"`）
    - 类型需为实例变量
3. **`students`**
    - 当前学期已注册的学生数组（容量固定，不可动态扩展）

##### **(b) 构造函数（b部分 ）**

实现构造函数：

```java
public CS61B(int capacity, CS61BStudent[] signups, String semester) { ... }
```

要求：

- 参数 `capacity` 表示课程最大容量
- 参数 `signups` 为报名学生数组（按报名顺序）
- 从 `signups` 中按顺序注册前 `capacity` 名学生到 `students` 数组
- 初始化 `semester` 实例变量
- **注意**：构造函数参数与实例变量同名时需正确区分（如 `semester`）

##### **(c) 方法实现（c部分 ）**

实现以下方法：

1. **`makeStudentsWatchLecture()`**
    - 功能：让当前学期所有已注册学生观看讲座
    - 返回：实际观看讲座的学生数量（即 `watchLecture()` 返回 `true` 的次数）
    - 类型：实例方法
2. **`changeUniversity(String newUniversity)`**
    - 功能：修改所有 `CS61B` 课程实例的大学名称
    - 类型：静态方法

##### **(d) 课程扩容（d 部分）**

实现方法：

```java
public void expand(int newCapacity) { ... }
```

功能：

- 将课程容量扩展至 `newCapacity`
- 将原 `signups` 数组中未注册的学生按顺序添加到扩容后的 `students` 数组中
- **挑战**：扩容时避免使用 `new` 以外的额外内存分配

---

#### **3. 代码框架**

需补全以下 `CS61B` 类：

```java
public class CS61B {
    // 变量声明 (a部分 )
    // --- 在此处声明 university、semester、students ---

    // 构造函数 (b部分)
    public CS61B(int capacity, CS61BStudent[] signups, String semester) {
        // 实现逻辑
    }

    // 方法实现 (c部分 )
    /** 统计实际观看讲座的学生数 */
    public int makeStudentsWatchLecture() { ... }

    /** 修改所有课程的大学名称 */
    public static void changeUniversity(String newUniversity) { ... }

    // 扩容方法 (d部分)
    public void expand(int newCapacity) { ... }
}
```

---

#### **4. 示例与提示**

- **示例 1**：


```java
    CS61BStudent[] signups = new CS61BStudent[] {
        new CS61BStudent(101), new CS61BStudent(102), new CS61BStudent(103) 
    };
    CS61B course = new CS61B(2, signups, "spring 2024");
    course.expand(3); // 扩容后 students 包含 101, 102, 103
```



- **关键提示**：
    
    - 使用 `System.arraycopy()` 高效复制数组
    - 注意静态变量与实例变量的作用域差异
    - 扩容时需保留原有学生数据

---

#### **5. 答案提交要求**

- 代码需通过编译并符合 Java 语法规范
- 在代码中标注关键逻辑注释
- 挑战题需明确说明实现思路