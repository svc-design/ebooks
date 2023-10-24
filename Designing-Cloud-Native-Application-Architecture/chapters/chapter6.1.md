# 编程语言的基本特性

## 基础类型

* 赋值语句：允许将值分配给变量或数据结构。
* 数字类型：支持整数和浮点数，可能有不同的精度。
* 布尔类型：包括真和假两个值，通常用于逻辑判断。
* 字符：用于表示单个字符，通常采用字符编码。
* 字符串：表示文本数据的序列，通常由字符组成。
* 数组：一种数据结构，用于存储相同类型的元素的有序集合。
* 动态数组：可以动态增长或缩小大小的数组，通常由编程语言的内置功能或库支持。
* 哈希表：一种键值对存储结构，允许通过键查找值，通常具有快速查找速度。

## 复合类型

* 元组：有序的元素集合，可以包含不同类型的数据。
* 结构体：自定义的数据类型，可以包含不同字段。
* 枚举：一种数据类型，包括一组命名的值。

## 控制流

分支：用于根据条件选择不同的代码路径。
循环：用于重复执行代码块，通常在特定条件下终止。
函数：用于封装可重用的代码块。
闭包：允许函数捕获并访问其周围范围的变量。

## 代码抽象 

* 类：属于面向对象编程（OOP）范畴，它是一种用于定义自定义数据类型的概念，包括对象的属性和方法。类用于封装数据和行为，具有与对象和类相关的特性。
* 库：属于软件开发和编程工具的范畴。库是一组可重用的代码、函数、数据结构和类的集合，用于提供通用功能，以便在不同的应用程序中重复使用。库可以涵盖多个编程领域，如标准库、第三方库等。
* 模块：模块是一种组织和封装代码的方式，通常属于编程语言或开发环境的范畴。模块可以包含变量、函数、类、结构体等代码元素，以提高代码的可维护性和可重用性。模块用于组织和划分代码，并有助于避免命名冲突。
* 接口：接口是编程中的概念，属于面向对象编程和编程规范的范畴。接口定义了对象应该具备的行为规范，而不涉及具体的实现。接口用于定义方法的签名，实现某个接口的类或结构体必须提供这些方法的具体实现。


# 基础类型

| 基础类型 | C语言 | Go | Rust | Python | JavaScript |
| --- | --- | --- | --- | --- | --- |
| 赋值语句 | = | := | = | = | = |
| 数字类型 | int, float | int, float | int, float | int, float | Number |
| 布尔类型 | bool | bool | bool | bool | boolean |
| 字符 | char | rune | char | str | string |
| 字符串 | char array | string | str | str | string |
| 数组 | Array | Array | Array | List | Array |
| 动态数组 | N/A | Slices | Vec | List | Array |
| 哈希表 | N/A | map | HashMap | dict | Object |

## 代码示例：

### C语言：

```
// 赋值语句
int x = 10;
float y = 3.14;
// 数字类型
int num = 42;
float pi = 3.14159;
// 布尔类型
int isTrue = 1; // 1表示True
int isFalse = 0; // 0表示False
// 字符
char letter = 'A';
// 字符串
char str[] = "Hello, World!";
// 数组
int arr[] = {1, 2, 3, 4, 5};
int arrSize = sizeof(arr) / sizeof(arr[0]);
```


### Go

```
Copy code
// 赋值语句
x := 10
y := 3.14
// 数字类型
num := 42
pi := 3.14159
// 布尔类型
isTrue := true
isFalse := false
// 字符
letter := 'A'
// 字符串
str := "Hello, World!"
// 数组
arr := [5]int{1, 2, 3, 4, 5}
```


### Rust

```
Copy code
// 赋值语句
let x = 10;
let y = 3.14;
// 数字类型
let num: i32 = 42;
let pi: f64 = 3.14159;
// 布尔类型
let is_true = true;
let is_false = false;
// 字符
let letter = 'A';
// 字符串
let s = "Hello, World!";
// 数组
let arr = [1, 2, 3, 4, 5];
```

### Python：

```
Copy code
# 赋值语句
x = 10
y = 3.14
# 数字类型
num = 42
pi = 3.14159
# 布尔类型
is_true = True
is_false = False
# 字符
char = 'A'
# 字符串
str = "Hello, World!"
# 数组
arr = [1, 2, 3, 4, 5]
```


### JavaScript：

```
javascript
Copy code
// 赋值语句
let x = 10;
let y = 3.14;
// 数字类型
let num = 42;
let pi = 3.14159;
// 布尔类型
let isTrue = true;
let isFalse = false;
// 字符
let letter = 'A';
// 字符串
let str = "Hello, World!";
// 数组
let arr = [1, 2, 3, 4, 5];
```

# 指针与引用

在 C、Go 和 Rust 中，指针是值类型，也就是说，指针变量本身也是一个值，可以被赋值给另一个变量。在 Python 和 JavaScript 中，指针是引用类型，也就是说，指针变量本身是一个引用，指向另一个值。

以下是 C、Go、Rust、Python 和 JavaScript 中与 C 语言类似的指针的使用示例：

### C
```
int main() {
  int* a = malloc(sizeof(int));
  *a = 10;
  printf("%d\n", *a); // 输出 10
  free(a);
  return 0;
}
请谨慎使用代码。了解详情
```

### Rust
```
func main() {
  var a *int
  a = new(int)
  *a = 10
  fmt.Println(*a) // 输出 10
  return
}
```

### Rust

```
fn main() {
  let mut a = 10;
  let ptr = &a;
  println!("{}", *ptr); // 输出 10
  *ptr = 20;
  println!("{}", a); // 输出 20
}
```

### Python

```
def main():
  a = 10
  b = &a
  print(b) # 输出 <class 'int'>
  *b = 20
  print(a) # 输出 20

main()
```

### JavaScript
```
function main() {
  const a = 10;
  const b = a;
  console.log(b); // 输出 10
  b = 20;
  console.log(a); // 输出 20
}

main()
```

# 复合类型

| 复合类型 | C语言 | Go | Rust | Python | JavaScript |
| --- | --- | --- | --- | --- | --- |
| 元组 | N/A | N/A | Tuple | N/A | N/A |
| 结构体 | struct | struct | struct | class | Object |
| 枚举 | enum | N/A | enum | enum | N/A |

## C语言

```
// 结构体
struct Person {
    char name[50];
    int age;
};
// 枚举
enum Color { RED, GREEN, BLUE };
```

### Go

```
// 结构体
type Person struct {
    Name string
    Age  int
}
```

### Rust

```
Copy code
// 结构体
struct Person {
    name: String,
    age: i32,
}
// 枚举
enum Color {
    Red,
    Green,
    Blue,
}
```


### Python

```
# 结构体（使用类）
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
# 枚举

from enum import Enum
class Color(Enum):
    RED = 1
    GREEN = 2
    BLUE = 3
```

### JavaScript：

```
javascript
Copy code
// 结构体（使用对象字面量）
let person = {
    name: "John",
    age: 30,
};
// 枚举（通常使用普通对象模拟）
const Color = {
    RED: 1,
    GREEN: 2,
    BLUE: 3,
};
```

请注意，元组在C语言、Python和JavaScript中没有直接的内置支持，因此在这些语言中通常使用数组或对象来模拟元组的功能。 Go语言和Rust支持元组。此外，Python使用类来模拟结构体，而JavaScript使用对象字面量，因此它们不是传统意义上的结构体。如果您需要更复杂的数据结构，还需要考虑方法和属性等因素。


# 控制流

| 控制流 | C语言 | Go | Rust | Python | JavaScript |
| --- | --- | --- | --- | --- | --- |
| 分支 | if-else | if-else | if-else | if-else | if-else |
| 循环 | for, while | for | for, while | for, while | for, while |
| 函数 | function | func | fn | def | function |
| 闭包 | N/A | func | closure | lambda | function |
| 类 | N/A | N/A | struct, impl | class | class |
| 模块 | N/A | package | mod | module | module |

### C语言：
```
// 分支
int x = 10;
if (x > 5) {
    printf("x 大于 5\n");
} else {
    printf("x 不大于 5\n");

// 循环
for (int i = 0; i < 5; i++) {
    printf("%d\n", i);
}

int i = 0;
while (i < 5) {
    printf("%d\n", i);
    i++;
}

// 函数
int add(int a, int b) {
    return a + b;
}

// 类（通过结构体模拟）
struct Person {
    char name[50];
    int age;
};

// 模块（C语言没有内置模块概念）
```

### Go

```
// 分支
x := 10
if x > 5 {
    fmt.Println("x 大于 5")
} else {
    fmt.Println("x 不大于 5")
}

// 循环
for i := 0; i < 5; i++ {
    fmt.Println(i)
}

i := 0
for i < 5 {
    fmt.Println(i)
    i++
}

// 函数
func add(a, b int) int {
    return a + b
}

// 闭包
func closure() func() int {
    count := 0
    return func() int {
        count++
        return count
    }
}

// 模块（Go使用包(package)组织代码）
```


### Rust：

rust
Copy code
```
// 分支
let x = 10;
if x > 5 {
    println!("x 大于 5");
} else {
    println!("x 不大于 5");
}

// 循环
for i in 0..5 {
    println!("{}", i);
}

let mut i = 0;
while i < 5 {
    println!("{}", i);
    i += 1;
}

// 函数
fn add(a: i32, b: i32) -> i32 {
    a + b
}

// 闭包
fn closure() -> impl FnMut() -> i32 {
    let mut count = 0;
    move || {
        count += 1;
        count
    }
}

// 类（通过结构体和实现模块模拟）
struct Person {
    name: String,
    age: i32,
}

impl Person {
    fn new(name: String, age: i32) -> Self {
        Person { name, age }
    }
}

// 模块
mod my_module {
    pub fn my_function() {
        println!("This is a function in the module.");
    }
}
```

### Python：

python
Copy code
```
# 分支
x = 10
if x > 5:
    print("x 大于 5")
else:
    print("x 不大于 5")

# 循环
for i in range(5):
    print(i)

i = 0
while i < 5:
    print(i)
    i += 1

# 函数
def add(a, b):
    return a + b

# 闭包（Python支持lambda表达式）
closure = lambda x: x + 1

# 类
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# 模块（Python使用模块组织代码）
```

### JavaScript：

```
// 分支
let x = 10;
if (x > 5) {
    console.log("x 大于 5");
} else {
    console.log("x 不大于 5");
}

// 循环
for (let i = 0; i < 5; i++) {
    console.log(i);
}

let i = 0;
while (i < 5) {
    console.log(i);
    i++;
}

// 函数
function add(a, b) {
    return a + b;
}

// 闭包
function closure() {
    let count = 0;
    return function () {
        count++;
        return count;
    };
}

// 类
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
}
```

// 模块（JavaScript使用模块进行代码组织，例如使用ES6模块）

