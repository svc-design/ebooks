
Rust 是一门系统级编程语言，其基础语法相对简单但功能强大。以下是 Rust 语言最新标准的基础语法示例以及如何在 Linux 下编译 Rust 代码的命令。

Hello World

rust
Copy code
fn main() {
    println!("Hello, World!");
}
变量和数据类型

rust
Copy code
fn main() {
    // 声明不可变变量
    let x = 5;
    // 声明可变变量
    let mut y = 10;
    // 显式指定数据类型
    let z: i32 = 15;
    // 字符串
    let name = "Alice";
    // 布尔值
    let is_true = true;
}
函数

rust
Copy code
fn add(a: i32, b: i32) -> i32 {
    a + b
}

fn main() {
    let result = add(3, 4);
    println!("3 + 4 = {}", result);
}
条件语句

rust
Copy code
fn main() {
    let number = 42;

    if number < 0 {
        println!("Number is negative");
    } else if number > 0 {
        println!("Number is positive");
    } else {
        println!("Number is zero");
    }
}
循环

rust
Copy code
fn main() {
    // for 循环
    for i in 1..=5 {
        println!("Count: {}", i);
    }

    // while 循环
    let mut j = 0;
    while j < 5 {
        println!("While loop: {}", j);
        j += 1;
    }
}
结构体和方法

rust
Copy code
struct Point {
    x: f64,
    y: f64,
}

impl Point {
    fn new(x: f64, y: f64) -> Point {
        Point { x, y }
    }

    fn distance(&self, other: &Point) -> f64 {
        ((self.x - other.x).powi(2) + (self.y - other.y).powi(2)).sqrt()
    }
}

fn main() {
    let p1 = Point::new(1.0, 2.0);
    let p2 = Point::new(4.0, 6.0);
    let dist = p1.distance(&p2);
    println!("Distance: {}", dist);
}
编译 Rust 代码

在 Linux 下，你可以使用 rustc 编译 Rust 代码。假设你的 Rust 代码保存在一个名为 main.rs 的文件中，以下是编译的命令：

bash
Copy code
rustc main.rs
这将生成一个可执行文件，通常命名为 main（根据你的 Rust 文件名），你可以运行它：

bash
Copy code
./main
这些示例演示了 Rust 的基础语法。你可以根据这些基础语法构建更复杂的程序和项目。要了解更多关于 Rust 语言的信息，可以访问 Rust 官方网站（https://www.rust-lang.org/）并查看官方文档。




User
rust 构建工具有哪些？
ChatGPT
Rust 生态系统提供了多种构建工具，用于管理和构建 Rust 项目。以下是一些常见的 Rust 构建工具：

Cargo:

Cargo 是 Rust 的官方构建工具，也是最常用的工具之一。它是一个依赖管理和构建工具，负责管理项目的依赖、构建项目、运行测试等。
使用示例：
创建新项目：cargo new my_project
构建项目：cargo build
运行项目：cargo run
运行测试：cargo test
Rustup:

Rustup 是 Rust 工具链的管理工具。它允许你安装和管理不同版本的 Rust 编译器，以及切换默认工具链。
使用示例：
安装 Rust：curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
安装其他 Rust 版本：rustup install stable, rustup install nightly
切换默认工具链：rustup default stable
Cargo Edit:

Cargo Edit 是一个 Cargo 插件，允许你通过命令行轻松添加、更新和删除依赖项。
使用示例：
添加依赖：cargo add some_crate
更新依赖：cargo upgrade
删除依赖：cargo rm some_crate
CMake-Rust:

CMake-Rust 是一个用于将 Rust 代码集成到 CMake 项目中的工具。它允许你使用 CMake 构建系统来管理和构建 Rust 代码。
使用示例：详细使用方法可参考官方文档。
Makefile:

你可以使用传统的 Makefile 来构建 Rust 项目，尤其是当需要与其他语言的项目集成时。在 Makefile 中，你可以定义自定义构建规则。
使用示例：编写自定义 Makefile 规则以构建 Rust 项目。
