# 应用软件的工程化

应用软件的功能需求、非功能需求和工程化问题是应用软件开发中不可或缺的部分。功能需求是软件必须实现的功能，非功能需求是软件必须满足的属性，工程化问题是软件开发过程中遇到的技术问题。

## 功能需求

功能需求是软件必须实现的功能，是软件开发的起点。功能需求可以分为两类：基本功能需求和附加功能需求。

- **基本功能需求**是软件必须实现的最基本的功能，是软件能够满足用户需求和业务要求的基础。
- **附加功能需求**是软件可以选择实现的功能，可以提升软件的用户体验和可用性。

## 非功能需求

非功能需求是软件必须满足的属性，包括性能需求、安全需求、可靠性需求、可扩展性需求和可维护性需求。

- **性能需求**是软件必须满足的性能指标，如响应时间、吞吐量等。
- **安全需求**是软件必须满足的安全性要求，如数据安全、系统安全等。
- **可靠性需求**是软件必须满足的可靠性要求，如容错性、可恢复性等。
- **可扩展性需求**是软件必须满足的可扩展性要求，如支持用户规模的增长等。
- **可维护性需求**是软件必须满足的可维护性要求，如易于理解、维护等。

## 工程化问题

工程化问题是软件开发过程中遇到的技术问题，包括软件设计问题、软件实现问题和软件部署问题。

- **软件设计问题**是软件的架构设计、算法设计等。
- **软件实现问题**是软件的编程、测试等。
- **软件部署问题**是软件的部署、运维等。

## 工作量占比

功能需求、非功能需求和工程化问题是应用软件开发中不可或缺的部分。功能需求是软件开发的起点，非功能需求是功能需求的延伸，工程化问题是满足功能需求和非功能需求的手段。在应用软件开发过程中，需要充分考虑这三方面的因素，才能开发出满足用户需求、符合业务要求、可靠安全、易于维护的软件，根据历史的统计经验，各自的占比参考如下：

| 名称 | 定义 | 关联关系 | 工作量占比 |
|:----|:----|:----|:----|
| 功能需求 | 软件必须实现的功能 | 非功能需求是功能需求的延伸 | 50% |
| 非功能需求 | 软件必须满足的属性 | 功能需求是软件开发的起点 | 30% |
| 工程化问题 | 软件开发过程中遇到的技术问题 | 满足功能需求和非功能需求的手段 | 20% |


## 开发流程

在传统的瀑布模型中，功能需求、非功能需求和工程化问题是分阶段进行的。在需求分析阶段，首先要定义功能需求，然后再定义非功能需求，最后才是工程化问题。在开发阶段，先是设计软件，然后是实现软件，最后是部署软件。这种开发模式的缺点是，在需求分析阶段，很难准确预测软件的非功能需求和工程化问题，这可能会导致软件在开发完成后无法满足用户需求或业务要求。

敏捷开发是一种迭代的开发模式，它将功能需求、非功能需求和工程化问题融入到开发过程中。在敏捷开发中，软件开发团队会在短时间内（通常是两周）交付一个可运行的软件版本，然后根据用户反馈进行迭代开发。这种开发模式的优点是，可以更灵活地满足用户需求和业务要求，同时也能提高软件的可靠性和可维护性。

DevOps 是一种软件开发和运维的协同方法论，它将软件开发和运维融为一体。在 Devops 中，软件开发团队和运维团队会紧密合作，共同确保软件的质量和可靠性。DevOps 可以帮助软件开发团队更好地满足用户需求和业务要求，同时也能提高软件的可靠性和可维护性。

| 内容 | 瀑布模型 | 敏捷开发 | DevOps |
|:----|:----|:----|:----|
| 优点 | 开发过程清晰、可控，易于管理和跟踪，适合大型、复杂的软件开发项目 | 灵活，适应变化的需求，开发周期短，成本低，有利于团队协作 | 提高软件质量和可靠性，缩短软件交付周期，降低软件开发成本 |
| 缺点 | 不灵活，难以满足变化的需求，开发周期长，成本高，不利于团队协作 | 开发过程不够清晰、可控，难以管理和跟踪，不适合大型、复杂的软件开发项目 | 需要团队的协作和配合，需要一定的技术和经验 |
| 功能需求 | 软件必须实现的功能 | 软件必须满足的属性 | 软件开发过程中遇到的技术问题 |
| 建议 | 在需求分析阶段，要充分考虑用户需求和业务要求，并尽可能准确地定义功能需求和非功能需求 | 在开发过程中，要采用迭代开发的方式，并根据用户反馈进行调整 | 要采用 Devops 的方法论，将软件开发和运维融为一体 |


瀑布模型和敏捷开发是两种截然不同的开发模式，各有优缺点。瀑布模型适合大型、复杂的软件开发项目，而敏捷开发适合小型、快速迭代的软件开发项目。Devops 是一种方法论，可以帮助软件开发团队更好地满足用户需求和业务要求，同时也能提高软件的可靠性和可维护性。在实际的软件开发中，可以根据项目的特点选择合适的开发模式和方法论.

软件工程化的重要性可以从以下几个方面概述：

- 标准化：通过统一的标准和流程，可以提高软件开发和运维的效率和可靠性。例如，Devops 倡导使用统一的代码库、版本控制系统、部署工具等，可以减少重复工作，提高开发和运维人员的协作效率。
- 流程化：通过建立完善的开发和运维流程，可以确保软件的质量和可靠性。例如，Devops 倡导采用持续集成/持续交付 (CI/CD) 模式，可以快速发现和修复软件中的缺陷。
- 自动化：通过自动化软件开发和运维的各个环节，可以提高效率和可靠性。例如，Devops 倡导采用自动化测试、自动化部署等工具和技术，可以减少人为错误，提高软件的质量和可靠性。

高效的软件工程化可以帮助开发团队在以下方面取得收益：

- 提高软件质量和可靠性：通过标准化、流程化和自动化，可以减少软件开发过程中的错误和缺陷，提高软件的质量和可靠性。
- 缩短软件交付周期：通过 CI/CD 模式，可以快速将软件从开发阶段交付到生产环境，\* 缩短软件交付周期。
- 降低软件开发成本：通过自动化，可以减少人力成本，降低软件开发成本。
- 提高软件开发和运维团队的协作效率：Devops 通过统一的标准和流程，可以促进软件开发和运维团队的协作，提高效率。

软件工程发展的趋势，可以帮助软件开发团队提高软件的质量、可靠性、交付速度和成本效益。以下表格是列举了不同阶段可以使用到的工具：

| 阶段 | 工具类型 | 工具 | 功能 |
|:----|:----|:----|:----|
| 需求分析 | 用户需求收集 | 问卷调查、访谈、用户反馈等 | 收集用户需求 |
| 需求分析 | 需求分析 | 需求文档管理工具、需求分析模型工具等 | 分析用户需求，生成需求文档，识别潜在的风险和问题 |
| 设计 | 软件设计 | UML 建模工具、架构设计工具等 | 生成设计文档，自动生成代码 |
| 编码 | 代码编辑器 | Visual Studio Code、Sublime Text、JetBrains IDE 等 | 编写代码 |
| 测试 | 自动化测试 | Selenium、JUnit、pytest 等 | 自动生成测试用例，分析测试结果 |
| 测试 | 测试辅助工具 | AI 可以自动生成测试用例，并分析测试结果 | ​ |
| 部署 | 持续集成/持续交付 (CI/CD) | Jenkins、Travis CI、GitLab CI/CD 等 | 自动化部署流程，根据需求进行调整 |
| 运维 | 监控工具 | Nagios、Zabbix、Prometheus 等 | 监控软件运行情况 |
| 运维 | 日志分析工具 | ELK、ClickHouse、Fluentd、Logstash 等 | 分析软件运行日志 |
| 运维 | 自动化运维工具 | Ansible、Chef、Puppet 等 | 自动化运维任务 |


随着人工智能（AI）和机器学习（ML）技术的不断发展，软件工程化也在发生一系列变化和改进

1. AI 驱动的软件工程：AI 可以用于辅助生成代码、执行测试软件、识别错误和缺陷、优化软件性能等。
2. ML 驱动的软件工程：例如，ML 可以用于预测软件开发风险、优化软件架构、自动生成文档等。
3. DevOPS的智能化：DevOPS 可以结合 AI 和 ML 技术，例如，可以快速完成自动化 CI/CD 流程、识别软件安全漏洞、分析软件性能等。

随着AIGC技术的成熟，软件工程化的形态，将可能会进一步巨大的改变，例如：

- AIGC 生成代码：AI 可以学习软件开发的模式和规律，从而自动生成代码。这可以提高软件开发的效率，并减少人为错误。
- AIGC 驱动测试：通过对话式的指令，可以自动生成测试用例，生成软件性能分析报告等，
- AIGC 驱动的软件工程全链路自动化：结合LangChain生态链中的，Agent/Tools，甚至可以像人一样听说读写，甚至能高度自动化完地成从用户需求分析、设计、编码、测试、部署到运维中的大部分基础工作。

**相关的部分基于AIGC的软件与服务**

| 软件/服务 | 功能 | 应用场景 |
|:----|:----|:----|
| GitHub Copilot | 代码生成 | 编码 |
| IntelliJ IDEA AI Assistant | 智能提示 | 编码 |
| Google AI Testable AI | 自动化测试 | 测试 |
| Langchain | 自动生成代码、测试软件、识别错误和缺陷、优化软件性能等 | 软件开发的各个环节 |


以下是一些具体的基于AIGC的软件功能介绍：

- GitHub Copilot：GitHub Copilot 是一个代码生成工具，可以帮助软件开发人员自动生成代码。
- IntelliJ IDEA AI Assistant：IntelliJ IDEA AI Assistant 是一个智能提示工具，可以帮助软件开发人员提高编码效率。
- Google AI Testable AI：Google AI Testable AI 是一个自动化测试工具，可以帮助软件开发人员发现和修复软件中的缺陷。
- Langchain：Langchain 是一个人工智能软件工程平台，可以帮助软件开发人员自动生成代码、测试软件、识别错误和缺陷、优化软件性能等。
这些软件与服务可以帮助软件开发人员提高软件开发的效率和质量，并降低软件开发的成本。

# 开发环境

**特别说明**: 

根据 Statcounter 的数据，2023年7月，Linux 服务器操作系统市场占有率为 76.4%，Windows 服务器操作系统市场占有率为 22.3%，除了部分传统企业中还存在一些Windows 服务器操作系统，考虑以下常见问题：

- 开发环境系统与实际线上服务器系统相同的操作系统一致
- 避免开发环境编码和实际线上系统编码不一致引发的问题
- 以及Windows 作为一个商业操作系统，在开发环境方面存在以下缺点：系统封闭，安全性较低；命令行工具功能有限，不易管理。虚拟化/容器化运行环境支持有限等问题。因此，不推荐使用 Windows 作为开发环境。如果需要在 Windows 下作为开发调试环境，可以使用 WSL（Windows Subsystem for Linux）来替代，如果条件具备，更推荐使用Linux/MacOS作为开发环境。在 C、Rust、Go、Python、JavaScript (前端Vue3/后端Nodejs) 开发环境设置步骤均以 Linux（Ubuntu/Fedora）和 MacOS 系统为开发环境为参考。

## C 语言

C 语言在 Linux（Ubuntu/Fedora）和 MacOS 下的开发环境设置步骤：

- Ubuntu/Linux  安装GCC编译器：
在终端中，更新系统软件包列表：sudo apt update && sudo apt install gcc
- Fedora/Linux  安装GCC编译器：
在终端中，更新系统软件包列表：sudo dnf update && sudo dnf install gcc
- MacOS 安装GCC编译器：
安装 Homebrew: 
    /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/master/install.sh](https://raw.githubusercontent.com/Homebrew/install/master/install.sh))"
在终端中，更新系统软件包列表：brew update && brew install gcc
- 验证GCC编辑器：
    - 创建一个 C 语言程序源码：hello.c

```C
#include <stdio.h>
int main() {
  printf("Hello, world!\n");
  return 0;
}
```

- 编译 C 程序：gcc hello.c -o hello
- 运行 C 程序：./hello 
- 输出：Hello, world!

额外的开发环境参考：

- 编译工具, C语言的编译工具有很多，开源的主要如下：
    - GCC：GNU Compiler Collection，是C语言、C++语言、Objective-C语言、Fortran语言、Ada语言、Go语言、Rust语言、D语言、Pascal语言等多种语言的编译器集合。
    - Clang：LLVM 项目的编译器，支持 C、C++、Objective-C、Objective-C++、Swift 等语言。
- 测试工具
    - Unittest：C++ 的单元测试框架，也可以用于 C 语言。
    - Google Test：Google 开发的单元测试框架，支持 C++ 和 C 语言。
- 部署打包工具,C语言的部署打包工具有很多，常用的有：
    - Make：用于构建 Makefile 文件的工具。
    - CMake：用于构建跨平台 Makefile 文件的工具。
    - ​
- 安装 IDE：在 Linux 上，可以使用 Visual Code、Atom，在 MacOS 上，可以使用 Xcode。
- 安装调试器：在 Linux 上，可以使用 GDB。在 MacOS 上，可以使用 LLDB。
- 安装代码质量工具：在 Linux 上，可以使用 Clang-Tidy。在 MacOS 上，可以使用 ClangFormat。
- 在 Linux（Ubuntu/Fedora）和 MacOS 上，除了安装 GCC 编译器之外，还需要安装开发库，才能进行更多实际的开发工作, 例如：
    - libstdc++：C++ 标准库
    - libgcc：GCC 编译器依赖的库
    - libpthread：线程库
    - libm：数学库
    - libssl：SSL/TLS 库
    - libcrypto：加密库

以下是各个开发库在 Ubuntu 和 Fedora 上的安装命令：

- Ubuntu/Linux：sudo apt-get install libstdc++ libgcc libpthread libm libssl libcrypto
- Fedora/Linux:  dnf install libstdc++ libgcc libpthread libm libssl libcrypto
- MacOS：brew install libstdc++ libgcc libpthread libm libssl libcrypto

## Vue3

在 Linux（Ubuntu/Fedora）和 MacOS 下的Vue3 开发环境设置步骤：

- Ubuntu/Linux 安装NodeJS，在终端中，更新系统软件包列表：
sudo apt update
sudo apt install sudo apt installl nodejs  npm -y 
npm install -g @vue/cli
- Fedora/Linux 安装NodeJS，在终端中，更新系统软件包列表：
sudo dnf update
sudo dnf install sudo dnf installl nodejs npm -y 
npm install -g @vue/cli
- MacOS 安装NodeJS：
安装 Homebrew: 
    /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/master/install.sh](https://raw.githubusercontent.com/Homebrew/install/master/install.sh))"
在终端中，更新系统软件包列表：
  brew update
  brew install nodejs npm
  npm install -g @vue/cli
- 验证 Vue3 开发环境：

```
创建一个 Vue3 项目： vue create my-project
进入项目目录：cd my-project
启动项目：npm run serve
```

额外的开发辅助工具参考：

- VS Code 适用于在 VS Code 中开发 JavaScript 代码的调试
- Chrome DevTools 适用于常规的 JavaScript 开发调试，包括代码高亮、断点设置、变量值查看等。
- Vue DevTools：用于调试 Vue 应用程序的工具。它提供了丰富的调试功能，包括代码高亮、断点设置、变量值查看、堆栈跟踪等
- ESLint：最流行的 JavaScript 代码风格校验工具。它提供了丰富的规则，可以帮助开发者检查代码中的错误和潜在问题。
- Prettier：代码格式化工具。它可以自动格式化代码，使其符合特定的代码风格。
- Husky：Git 钩子工具。它可以用于在提交代码之前自动运行 ESLint 和 Prettier 进行代码风格校验。
- Weex Studio：用于开发基于 Vue3 的 Web 应用和原生应用。
- Android Studio：用于开发 Android 应用。
- Xcode：用于开发 iOS 应用。

## Rust

在 Linux（Ubuntu/Fedora）和 MacOS 下的Rust 开发环境设置步骤：

- Ubuntu/Linux 安装NodeJS，在终端中，更新系统软件包列表：
安装 Rust: curl [https://sh.rustup.rs](https://sh.rustup.rs) -sSf | sh
验证 Rust 安装是否成功： rustc --version
- Fedora/Linux 安装NodeJS，在终端中，更新系统软件包列表：
安装 EPEL 软件源。 sudo yum install epel-release
安装 Rust: curl [https://sh.rustup.rs](https://sh.rustup.rs) -sSf | sh
验证 Rust 安装是否成功: rustc --version
- MacOS 安装NodeJS：
安装 Homebrew: /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/master/install.sh](https://raw.githubusercontent.com/Homebrew/install/master/install.sh))"
使用 Homebrew 安装 Rust: brew install rust
验证 Rust 安装是否成功: rustc --version
- 验证 Rust 开发环境：fn main() {
    println!("Hello, world!");
}
    1. cargo new my-project
    2. 在 src/main.rs 文件中，添加以下代码：
- 在终端中，切换到 my-project 文件夹，并执行以下命令来编译该项目：cargo build 将生成一个名为 my-project 的可执行文件。
- 运行该项目，请执行以下命令：cargo run 将运行项目的可执行文件，并打印一条消息“Hello, world!” 

额外的开发辅助工具参考：

- Rust-test：Rust 单元测试框架。
- Criterion：Rust 性能测试框架。
- Bencher：Rust 基准测试工具。
- Rust-analyzer-server：Rust 语言服务器的远程版本。
- Rust-analyzer-vscode：Rust 语言服务器的 VS Code 插件
- Rust-doc：Rust 文档生成工具。它可以生成 Rust 程序的文档。
- Cargo-edit：Cargo 包管理器的插件，可以用于快速创建、编辑和管理 Cargo 项目。
- Rustfmt：代码格式化工具。它可以自动格式化代码，使其符合特定的代码风格。
- Clippy：Rust 代码分析工具。它可以帮助开发者发现代码中的错误和潜在问题。
- Rust-analyzer：Rust 语言服务器。它可以提供语法高亮、代码补全、智能提示等功能。

## Go

在 Linux（Ubuntu/Fedora）和 MacOS 下的 Go 开发环境设置步骤如下：

- Ubuntu/Linux 安装 Go
更新系统软件包列表：sudo apt update
安装 Go：sudo apt install golang
配置环境变量：echo "export GOROOT=/usr/lib/go" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$GOROOT/bin:$PATH" >> ~/.bashrc加载环境变量：source ~/.bashrc
验证 Go 版本：go version
- Fedora/Linux 安装 Go
更新系统软件包列表：sudo dnf update
安装 Go： sudo dnf install go
配置环境变量：echo "export GOROOT=/usr/lib/go" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$GOROOT/bin:$PATH" >> ~/.bashrc
加载环境变量：source ~/.bashrc
验证 Go 版本： go version
- MacOS 安装 Go
安装 Homebrew：/usr/bin/ruby -e "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/master/install](https://raw.githubusercontent.com/Homebrew/install/master/install))"
使用 Homebrew 安装 Go：brew install go
验证 Go 版本： go version
- 验证 Go 开发环境
main.go 文件是 Go 程序的入口点，创建 main.go：

```
package main

import "fmt"

func main() {
    fmt.Println("Hello, world!")
}
```

使用 go build 和 go run 命令分别编译和运行 Go 程序：

编译 Go 程序: go build -o helloworld

运行 Go 程序: ./helloworld 

终端会返回 Hello, world!

- 额外的开发辅助工具参考
    - GoLand：一个由 JetBrains 开发的基于 IntelliJ IDEA 的 IDE，专为 Go 语言开发而设计。
    - Visual Code：一个由 Microsoft 开发的开源 IDE，支持多种编程语言，包括 Go。
    - GoEdit：一个由 Andrew Gerrand 开发的基于 Vim 的 IDE，专为 Go 语言开发而设计。

 **注意事项** 

- 在 Ubuntu 和 Fedora 中，Go 的安装包默认安装在 /usr/lib/go 目录中。
- 在 MacOS 中，Go 的安装包默认安装在 /usr/local/opt/go 目录中。
- 可以使用 go env 命令查看 Go 的环境变量。

## Python

在 Linux（Ubuntu/Fedora）和 MacOS 下的 Python 开发环境设置步骤

- Ubuntu/Linux 安装 Python
在终端中，更新系统软件包列表：sudo apt update
安装 Python：sudo apt install python3
- Fedora/Linux 安装 Python
在终端中，更新系统软件包列表：sudo dnf update 
安装 Python：sudo dnf install python3
- MacOS 安装 Python
在终端中，安装 Homebrew：/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/master/install.sh](https://raw.githubusercontent.com/Homebrew/install/master/install.sh))"
使用 Homebrew 安装 Python：brew install python
- 验证 Python 开发环境

在终端中，创建一个简单的 Python 脚本：保存为 main.py

```
def greet(name):
    print(f"Hello, {name}!")

if __name__ == "__main__":
    greet("Bard")
```

在终端中，运行脚本： python main.py

如果脚本成功运行，将会输出以下内容：Hello, Bard!

- 额外的开发辅助工具参考
    - IDE： PyCharm、Visual Studio Code、IDLE
    - 代码库管理： Git、GitHub
    - 测试工具： unittest、pytest
    - 文档生成工具： Sphinx
    - 部署工具： Docker、WSGI
- 额外说明
    - Python 版本： 建议使用最新的 Python 3.x 版本。
    - 默认解释器： 在 Ubuntu 和 Fedora 中，Python 3 默认是默认解释器。如果您的系统安装了多个 Python 版本，可以使用以下命令设置默认解释器：sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
    - 开发环境配置： 可以根据自己的需要配置 Python 开发环境，例如安装第三方库、配置 IDE 等

# DevOPS 实践

## 概述

推荐使用 git 作为代码仓库版本控制的理由如下：

- 协作：Git 支持多用户协作，可以方便多个开发人员同时开发同一项目。
- 版本控制：Git 是目前最流行的版本控制系统，具有强大的版本管理功能。
- 可扩展性：Git 是开源软件，具有强大的可扩展性，可以根据需要添加新的功能和特性。

GitHub Actions 是 GitHub 提供的持续集成/持续交付 (CI/CD) 服务，可以帮助开发人员自动化代码构建、测试和部署过程。GitHub Actions 具有以下优势：

- 免费使用：GitHub Actions 是 GitHub 提供的免费服务，个人用户可以无限制地使用。
- 易于使用：GitHub Actions 使用 YAML 语言编写，语法简单，易于学习和使用。
- 可扩展性强：GitHub Actions 支持各种 CI/CD 任务，可以根据需要进行扩展和定制。
- 与 GitHub 集成：GitHub Actions 与 GitHub 深度集成，可以利用 GitHub 的众多功能，例如代码管理、版本控制、协作等。
- 持续集成 (CI)：GitHub Actions 可以自动构建代码，并使用单元测试和集成测试来验证代码质量。
- 持续交付 (CD)：GitHub Actions 可以自动将代码部署到本地、开发环境、测试环境或生产环境。

其他可选的有 Gitlab 以及国内的 CI/CD 服务：腾讯云CodeBuild、阿里云效、华为云 CodeBuild，可以根据需要选择。

除了上述工具之外，软件项目开发还可以使用其他一些工具，例如：

- 项目管理工具：Jira、Trello 等。
- 文档管理工具：Confluence、Wiki 等。
- 协作工具：Slack、Zoom 等。

 **额外说明**

如果是大陆区域使用Github因为GFW策略等原因，访问速度会比较慢，建议使用Xtls等开源项目加速器改善

## 环境信息

| 名称 | 服务 | 描述  |
|:----|:----|:----|
| **代码仓库** | github.com | 存储代码、管理版本、协作开发 |
| **CI** | github action | 持续集成、构建、测试 |
| **CD** | github action | 持续交付/持续部署 |
| **部署环境** | k3s/单机部署 | 用于部署和运行应用程序 |


## GitHub Actions CICD

在代码仓库中，添加 GitHub Actions 工作流的 YAML 文件 .github/workflows/pipeline.yaml  就可以以触发运行 CICD Pipeline：

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-admin/a6ee8692441b0506a2a6527647dbab55.png)

详细介绍下这个CICD Pipeline 构建测试和部署流程中的 jobs:

- build：构建

该 job 负责构建应用程序的二进制文件。它首先克隆代码库，然后安装构建所需的依赖项。最后，它使用 make 命令构建二进制文件。

- test：测试

该 job 负责运行应用程序的测试用例。它首先克隆代码库，然后安装测试所需的依赖项。最后，它使用 make test 命令运行测试用例。

- Build Image：构建 Docker 镜像

该 job 负责构建并推送应用程序的 Docker 镜像。它首先克隆代码库，然后使用 Kaniko 工具构建 Docker 镜像。最后，它使用 docker push 命令推送 Docker 镜像到 Artifact Registry。

- setup-k3s：设置 K3s 集群

该 job 负责设置 K3s 集群。它首先克隆代码库，然后安装 Ansible 工具。最后，它使用 Ansible  playbook 创建 K3s 集群。

- deploy-app: 部署应用程序

该 job 负责部署应用程序到 K3s 集群。它首先克隆代码库，然后使用 Ansible  playbook 部署应用程序。

# C 语言项目

## 项目代码仓库

- C语言项目开发的标准参考目录结构如下：

```
├── bin
├── doc
│   ├── design.md
│   ├── README.md
├── include
│   └── header.h
├── lib
│   └──Makefile 
├── main.c
├── test.c
├── Makefile
└── Dockerfile
```

说明：

- bin  目录用于存放可执行文件。
- doc 目录用于存放文档，包括设计文档、README 文件、需求文档等。
- include 目录用于存放头文件。
- lib 目录用于存放库文件。
- lib/Makefile 用于编译 lib 目录。
- main.c 目录用于存放源文件。
- Makefile 用于编译、测试和部署项目。
- Dockerfile 用于构建容器镜像

相关C 的小程序代码仓库参考，[https://github.com/svc-design/Scaffolding-C](https://github.com/svc-design/Scaffolding-C)，这是一个可以实现查看Linux系统信息的C程序，包含头文件定义，函数库，以及单元测试代码等，软件开发必备的部分。 

## Dockerfile

以下是多阶段构建的示例：

```
# 基础镜像
FROM debian:latest as builder

# 安装编译依赖
RUN apt-get update && apt-get install -y gcc libc6-dev make

# 编译程序
COPY . /app
WORKDIR /app
RUN make

# 生成可执行文件
RUN mv sysinfo /usr/bin/sysinfo

# 运行镜像
FROM debian:latest

# 添加可执行文件
COPY --from=builder /usr/bin/sysinfo /usr/bin/sysinfo

# 运行程序
CMD ["/bin/sh"]
```

在这个示例中，我们使用了两个基础镜像：debian:latest 和 debian:latest。第一个基础镜像用于编译程序，第二个基础镜像用于运行程序。

在第一个阶段中，我们使用 debian:latest 基础镜像来安装编译依赖项。然后，我们将程序的源代码复制到容器内，并将工作目录切换到 /app。最后，我们使用 make 命令来编译程序。

在第二阶段中，我们使用 debian:latest 基础镜像来添加可执行文件。然后，我们指定 /bin/sh 作为运行程序的命令。

## Pipeline

在 Scaffolding-C.git 仓库中，添加了 GitHub Actions 工作流的 YAML 文件 .github/workflows/pipeline.yaml 

GitHub Actions 的管理界面 [https://github.com/svc-design/Scaffolding-C/actions](https://github.com/svc-design/Scaffolding-C/actions) ，手动触发 Run workflows 

如需在自己的账号运行这个Demo，只需要将[https://github.com/svc-design/Scaffolding-C.git](https://github.com/svc-design/Scaffolding-C.git)  这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

# Python 语言项目

Python 语言项目开发的标准参考目录结构

## 项目目录参考

- Python 语言项目开发的标准参考目录结构如下：

```
myproject/
├── src/
│   └── example_pkg/
│       ├── __init__.py
│       └── core.py
├── tests/
│   └── example_pkg/
│       └── test_core.py
├── setup.py
├── Dockerfile
└── readme.md
```

其中：

- src 目录是项目的源码目录，存放项目的所有 Python 源代码文件，包括模块、类、函数等。
- example\_pkg 是项目的包目录，存放项目的所有包。
- **init**.py 文件是 Python 包的入口文件，用于定义包的名称和导入路径。
- core.py 是项目的核心模块，存放项目的主要逻辑。
- tests 目录是项目的测试目录，存放项目的所有测试用例。
- test\_core.py 是项目的核心模块的测试用例。
- setup.py 文件是项目的打包文件，用于打包项目为 Python 包。
- readme.md 文件是项目的说明文件，用于描述项目的功能、用法等。

这种目录结构具有以下优点：

- 将项目的源码和测试代码分离，便于开发和维护。
- 将项目的包结构清晰地划分，便于导入和管理。
- 使用 setup.py 文件打包项目，便于发布和部署。

具体的目录结构可以根据项目的实际情况进行调整。例如，对于简单的项目，可以将 src 和 tests 目录合并为一个目录。对于大型的项目，可以根据模块的功能划分多个子包。

## Dockerfile

以下是一个 Dockerfile 多阶段构建的示例：

```Dockerfile
# 第一阶段：编译阶段
FROM python:3.10-buster AS builder

# 安装编译依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    python3-pip

# 复制源代码
COPY . /app

# 编译项目
RUN pip3 install -r /app/requirements.txt
RUN python3 setup.py build

# 第二阶段：运行阶段
FROM python:3.10-slim-buster

# 复制编译产物
COPY --from=builder /app/dist/myproject-0.1.0-py3-none-any.whl /app

# 安装运行依赖
RUN pip3 install /app/myproject-0.1.0-py3-none-any.whl

# 启动项目
CMD ["python3", "/app/myproject/main.py"]
```

这个 Dockerfile 使用了两阶段构建：

第一阶段：用于编译项目。该阶段使用了 python:3.10-buster 镜像作为基础镜像，并安装了编译依赖。然后，将项目的源代码复制到镜像中，并使用 pip3 进行编译。

第二阶段：用于运行项目。该阶段使用了 python:3.10-slim-buster 镜像作为基础镜像，并安装了运行依赖。然后，将第一阶段编译的产物复制到镜像中，并启动项目。

使用多阶段构建，可以将编译依赖和运行依赖分离，从而减少镜像的大小和体积。

## Pipeline

在 Scaffolding-Python.git 仓库中，添加了 GitHub Actions 工作流的 YAML 文件 .github/workflows/pipeline.yaml 

GitHub Actions 的管理界面 [https://github.com/svc-design/Scaffolding-Python/actions](https://github.com/svc-design/Scaffolding-Python/actions) ，手动触发 Run workflows 

如需在自己的账号运行这个Demo，只需要将[https://github.com/svc-design/Scaffolding-Python.git](https://github.com/svc-design/Scaffolding-Python.git)  这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

# JavaScript 语言项目

## 前端/Vue3 项目

以下是一个 JavaScript 语言 Vue3 项目开发的标准参考目录结构：

```
myproject/
├── public/
│   ├── index.html
│   └── favicon.ico
├── src/
│   ├── components/
│   │   └── HelloWorld.vue
│   ├── App.vue
│   ├── main.js
│   └── router.js
├── .gitignore
├── package.json
└── README.md
```

其中：

- public 目录是项目的静态资源目录，存放项目的 HTML、CSS、JavaScript 等静态资源文件。
- src 目录是项目的源码目录，存放项目的所有 Vue 组件、代码文件等。
- components 目录是项目的组件目录，存放项目的所有 Vue 组件。
- App.vue 是项目的入口文件，定义项目的根组件。
- main.js 是项目的主文件，用于初始化 Vue 实例。
- router.js 是路由文件，用于定义项目的路由规则。
- .gitignore 文件是 Git 忽略文件，用于指定 Git 不应该跟踪的文件或目录。
- package.json 文件是项目的包文件，用于指定项目的依赖项。
- README.md 文件是项目的说明文件，用于描述项目的功能、用法等。

 **前端/Vue3 项目 Dockerfile** 

以下是一个前端/Vue3 项目 Dockerfile 多阶段构建的示例

```Dockerfile
# 第一阶段：编译阶段
FROM node:18-alpine AS builder

# 复制源代码
COPY . /app

# 安装依赖, 编译项目
RUN apk add --no-cache --virtual .build-deps git nodejs npm \
        npm install  && npm run build

# 第二阶段：运行阶段
FROM nginx:1.22-alpine

# 复制编译产物
COPY --from=builder /app/dist /usr/share/nginx/html

# 配置 Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]
```

这个 Dockerfile 使用了两阶段构建：

- 第一阶段：用于编译项目。该阶段使用了 node:18-alpine 镜像作为基础镜像，并安装了依赖。然后，将项目的源代码复制到镜像中，并使用 yarn 进行编译。
- 第二阶段：用于运行项目。该阶段使用了 nginx:1.22-alpine 镜像作为基础镜像，并复制第一阶段编译的产物到镜像中。然后，配置 nginx 并启动 nginx。

## 后端 NodeJS/Express 项目

后端 NodeJS / Express 项目开发的标准参考目录结构如下：

```
myproject/
├── bin/
│   └── start.sh
├── config/
│   └── database.json
├── app/
│   ├── controllers/
│   │   └── HelloWorldController.js
│   ├── middleware/
│   │   └── LoggingMiddleware.js
│   ├── models/
│   │   └── User.js
│   └── routes/
│       └── index.js
├── node_modules/
├── package.json
└── README.md
```

其中：

- bin 目录是项目的启动脚本目录，存放项目的启动脚本。
- config 目录是项目的配置文件目录，存放项目的所有配置文件。
- app 目录是项目的源码目录，存放项目的所有业务逻辑代码。
- controllers 目录是项目的控制器目录，存放项目的所有 HTTP 控制器。
- middleware 目录是项目的中间件目录，存放项目的所有中间件。
- models 目录是项目的数据模型目录，存放项目的数据模型。
- routes 目录是项目的路由目录，存放项目的所有路由。
- node\_modules 目录是项目的依赖项目录，存放项目的所有依赖项。
- package.json 文件是项目的包文件，用于指定项目的依赖项。
- README.md 文件是项目的说明文件，用于描述项目的功能、用法等。

**后端 NodeJS / Express 项目 Dockerfile 多阶段构建的示例**

以下是一个使用多阶段构建构建后端 NodeJS / Express 项目的 Dockerfile 示例：

```Dockerfile
# 第一阶段：安装依赖
FROM node:18-alpine AS build

WORKDIR /app

COPY package.json .

RUN npm install

# 第二阶段：构建应用程序
FROM node:18-alpine AS production

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD ["node", "index.js"]
```

这个 Dockerfile 分为两个阶段：

第一阶段：安装依赖

第二阶段：构建应用程序

- 第一阶段使用 node:18-alpine 镜像作为基础镜像。该镜像是一个小巧的 Alpine Linux 发行版，预装了 Node.js 18。

该阶段首先将 package.json 文件复制到工作目录。然后，它使用 npm install 命令安装依赖。

- 第二阶段使用 node:18-alpine 镜像作为基础镜像。该镜像与第一阶段相同。

该阶段使用 COPY --from=build /app . 命令将第一阶段构建的应用程序复制到工作目录。然后，它使用 EXPOSE 3000 命令公开应用程序的端口 3000。最后，它使用 CMD "node", "index.js" 命令指定应用程序的启动命令。

## Pipeline

在 Scaffolding-JavaScript.git 仓库中，添加了 GitHub Actions 工作流的 YAML 文件 .github/workflows/pipeline.yaml 

GitHub Actions 的管理界面 [https://github.com/svc-design/Scaffolding-JavaScript/actions](https://github.com/svc-design/Scaffolding-JavaScript/actions) ，手动触发 Run workflows 

如需在自己的账号运行这个Demo，只需要将[https://github.com/svc-design/Scaffolding-JavaScript.git](https://github.com/svc-design/Scaffolding-JavaScript.git)  这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

# GO 语言项目

## 项目目录参考

```
myproject
├── go.mod
├── go.sum
├── cmd
│   └── main.go
├── internal
│   ├── api
│   │   └── server.go
│   └── pkg
│       └── util.go
└── pkg
    └── mypubliclib
        └── mypubliclib.go
```

在这个示例中，项目的Go目录包含以下文件：

- go.mod：项目的模块文件，用于指定项目的依赖关系。
- go.sum：项目的依赖关系的哈希值，用于验证依赖库的版本。
- cmd/main.go：项目的主入口文件。
- internal/api/server.go：项目的 API 实现文件。
- internal/pkg/util.go：项目的工具包文件。
- pkg/mypubliclib/mypubliclib.go：项目的公共库文件。

具体的目录结构可以根据项目的需要进行调整

## 多阶段构建的Dockerfile示例

以下是一个 GO 语言项目 Dockerfile 多阶段构建的示例：

```Dockerfile
# 第一阶段：构建 Go 应用程序
FROM golang:1.18-alpine AS build

# 设置工作目录
WORKDIR /go/src/app

# 复制源代码
COPY . .

# 编译 Go 应用程序
RUN go build -o app .

# 第二阶段：构建运行时镜像
FROM scratch

# 复制编译好的 Go 应用程序
COPY --from=build /go/src/app/app /app

# 设置工作目录
WORKDIR /app

# 运行 Go 应用程序
CMD ["./app"]
```

这个 Dockerfile 分为两个阶段：

第一阶段：使用 golang:1.18-alpine 镜像作为基础镜像，编译 Go 应用程序。

第二阶段：使用 scratch 镜像作为基础镜像，复制编译好的 Go 应用程序，并设置工作目录和运行命令。

## Pipeline

在 Scaffolding-JavaScript.git 仓库中，添加了 GitHub Actions 工作流的 YAML 文件 .github/workflows/pipeline.yaml 

GitHub Actions 的管理界面 [https://github.com/svc-design/Scaffolding-Go/actions](https://github.com/svc-design/Scaffolding-Go/actions) ，手动触发 Run workflows 

如需在自己的账号运行这个Demo，只需要将[https://github.com/svc-design/Scaffolding-Go.git](https://github.com/svc-design/Scaffolding-Go.git)  这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

# Rust 语言项目

## 项目目录参考

Rust 语言项目的标准参考目录结构如下：

```
.
├── Cargo.toml
├── src
│   └── main.rs
└── tests
    └── tests.rs
```

- Cargo.toml 文件是 Rust 项目的配置文件，用于指定项目的依赖项、编译选项等。
- src 目录存放项目的源代码。
- main.rs 文件是项目的主入口文件，用于启动项目。
- tests 目录存放项目的测试代码。

## 多阶段构建 Dockerfile 的示例

Rust语言 项目的 Dockerfile 多阶段构建示例如下：

```Dockerfile
# 第一阶段：Rust 编译
FROM rust:1.62.0-slim
WORKDIR /app
COPY . .
RUN cargo build --release

# 第二阶段：生成可执行文件

FROM scratch
COPY --from=0 /app/target/release/my_app /my_app
CMD ["/my_app"]
```

请谨慎使用代码。了解详情

该 Dockerfile 使用两阶段构建：

第一阶段使用 Rust 官方镜像进行 Rust 编译，将编译后的可执行文件复制到 /app 目录。

第二阶段使用一个空镜像，从第一阶段复制可执行文件，并将其设置为容器的启动命令。

## Pipeline

在 Scaffolding-JavaScript.git 仓库中，添加了 GitHub Actions 工作流的 YAML 文件 .github/workflows/pipeline.yaml 

GitHub Actions 的管理界面 [https://github.com/svc-design/Scaffolding-Rust/actions](https://github.com/svc-design/Scaffolding-Rust/actions) ，手动触发 Run workflows 

如需在自己的账号运行这个Demo，只需要将[https://github.com/svc-design/Scaffolding-Rust.git](https://github.com/svc-design/Scaffolding-Rust.git)  这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。
