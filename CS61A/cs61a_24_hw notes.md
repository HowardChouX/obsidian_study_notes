## f-strings

```python
>>> feeling = 'love'
>>> course = '61A!'
>>> f'I {feeling} {course}'
'I love 61A!'
```
f在字符串前字符串类加{变量}

## 数字拆分

- 共有两种思路，一种是向%取余个位数，然后再反转。
- 另外一种是用while直接计算数字位数然后再用while整除
```python
# 从右向左求最后反转
def spilt_digits_reverse(n):
    if n == 0:
        return [0]

    digits = []
    while n:
        digits.append(n % 10)
        n //= 10
    digits.reverse()
    return digits

# 从左向右求不能使用反转

def spilt_digits_noreverse(n):
    if n == 0:
        return [0]

    temp = n
    num = 0 #数字总位数
    while temp:
        num += 1
        temp //= 10

    divisor = 10 ** (num - 1)
    digits = []
    while divisor:
        digit = n // divisor
        digits.append(digit % 10)
        divisor //= 10
    return digits

```

## 链表指针思想

```python
def array_to_link(arr):
	s = [1,2,3]
	len_s = len(s)
	head = Link(s[0])
	current = head

	i = 0
	while i < len_s:
		current.rest = Link(s[i])
		current = current.rest
		i += 1
	return head
	
	
```


## let(hw07)

```scheme

(define (repeatedly-cube n x)
  (if (zero? n)
      x
	  (let ((y (repeatedly-cube (- n 1) x))) ; Bind the recursive result to `y`
	       (* y y y))))                        ; Cube `y` and return the result
```



## **递归辅助函数-选或者不选**(diss09)

```scheme
(define (f total n k)
    (if (and (= n 0) (= total 0))
        #t
    (if (< total (* k k))
        #f
    (or (f (- total (* k k)) (- n 1) (+ k 1)) (f total n (+ k 1)))
    )))
```

## Scheme 列表和引用
Scheme 列表是链表。快速复习：

- nil 和 () 是一样的：空列表。
- (cons first rest) 构造一个链表，first 是链表的第一个元素，rest 是链表中剩余的部分，rest 应该始终是一个列表。
- (car s) 返回列表 s 的第一个元素。
- (cdr s) 返回列表 s 的其余部分。
- (list ...) 接受 n 个参数，并返回一个长度为 n 的列表，这些参数作为元素。
- (append ...) 接受 n 个列表作为参数，并返回一个包含所有这些列表的元素的列表。
- (draw s) 绘制列表 s 的链表结构。它只在 code.cs61a.org/scheme 上有效。现在- 尝试一下，例如 (draw (cons 1 nil))。
- 引用一个表达式会使其不被计算。例子：
	- 'four 和 (quote four) 都计算结果为符号 four。
	- '(2 3 4) 和 (quote (2 3 4)) 都计算结果为包含三个元素的列表：2、3 和 4。
	- '(2 3 four) 和 (quote (2 3 four)) 都计算结果为包含 2、3 和符号 four 的列表。

