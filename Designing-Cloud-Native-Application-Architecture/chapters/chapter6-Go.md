
Go 语言的一些基础语法和示例代码，以及在 Linux 下进行编译的命令：

包声明和导入：

go
Copy code
package main

import (
    "fmt"
    "math/rand"
)
函数定义和调用：

go
Copy code
func main() {
    fmt.Println("Hello, World!")
    randomNumber := rand.Intn(100)
    fmt.Printf("Random Number: %d\n", randomNumber)
}
变量声明和赋值：

go
Copy code
var x int
x = 5

y := 10 // 自动类型推断
条件语句：

go
Copy code
if x > 0 {
    fmt.Println("x 是正数")
} else if x < 0 {
    fmt.Println("x 是负数")
} else {
    fmt.Println("x 是零")
}
循环：

go
Copy code
for i := 0; i < 5; i++ {
    fmt.Println(i)
}

numbers := []int{1, 2, 3, 4, 5}
for _, num := range numbers {
    fmt.Println(num)
}
函数定义和调用：

go
Copy code
func add(x, y int) int {
    return x + y
}

sum := add(3, 4)
fmt.Printf("Sum: %d\n", sum)
结构体和方法：

go
Copy code
type Rectangle struct {
    width  int
    height int
}

func (r Rectangle) area() int {
    return r.width * r.height
}

rect := Rectangle{width: 5, height: 3}
fmt.Printf("矩形面积: %d\n", rect.area())
编译 Go 程序的命令（假设文件名为 main.go）：

sh
Copy code
go build main.go
这将生成一个可执行文件 main，你可以运行它：

sh
Copy code
./main
请确保你已经安装了 Go 编程语言的编译器和运行环境。在 Linux 中，你可以使用包管理工具安装 Go，如 apt、yum 或 snap。
