- 第一从从项目结构中导入库

- 第二部import常用库（如下为diss02 的测试）
```java
package diss2_Scope_Static_Linked_Lists_Arrays;  
import org.junit.Test;  
import static org.junit.Assert.*;  
public class FuncRotateTest {  
  
    @Test  
    public void testBasicRotation() {  
        int[] input = {1, 2, 3, 4, 5};  
        int[] expected = {3, 4, 5, 1, 2}; // 右移3位  
        // 实际会抛出 ArrayIndexOutOfBoundsException        assertArrayEquals(expected, FuncRotate.rotate(input, 3));  
    }  
    @Test  
    public void testBasicRotation2() {  
        int[] expected2 = {2,3,4,5,1};  
        int[] input2 = {1,2,3,4,5};  
        assertArrayEquals(expected2,FuncRotate.rotate(input2,-1));  
    }  
  
}
```