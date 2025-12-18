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







