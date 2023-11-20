# 开发环境

C 语言在 Linux（Ubuntu/Fedora）和 MacOS 下的开发环境设置步骤：

- Ubuntu/Linux  安装GCC编译器：
在终端中，更新系统软件包列表：sudo apt update && sudo apt install gcc
- Fedora/Linux  安装GCC编译器：
在终端中，更新系统软件包列表：sudo dnf update && sudo dnf install gcc
- MacOS 安装GCC编译器：
安装 Homebrew: 
    - /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/](https://raw.githubusercontent.com/Homebrew/). install/HEAD/install.sh)"
    - 如果因为GFW无法执行，可以手动下载 [https://github.com/Homebrew/install/blob/master/install.sh](https://github.com/Homebrew/install/blob/master/install.sh) 安装脚本执行 
    - 安装后在终端中配置环境变量，安装GCC编译器
      eval "$(/opt/homebrew/bin/brew shellenv)"
      (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
      source ~/.zprofile
      brew update && brew install gcc
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

# 项目代码仓库

- C语言项目开发的标准参考目录结构如下：

```
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

相关代码仓库参考，[https://github.com/SvcDesignScaffolding/C.git](https://github.com/SvcDesignScaffolding/C.git)，这是一个可以实现查看Linux系统信息的C程序，包含头文件定义，函数库，以及单元测试代码等，软件开发必备的部分。 

# Dockerfile

以下是多阶段构建的示例：

```
# 基础镜像
FROM debian:latest as builder

# 安装依赖
RUN apt-get update && apt-get install -y gcc libc6-dev make

# 编译程序
COPY . /app
WORKDIR /app
RUN make

# 生成可执行文件
RUN mv sysinfo /usr/bin/sysinfo

# 运行镜像
FROM debian:latest as prod

# 添加可执行文件
COPY --from=builder /usr/bin/sysinfo /usr/bin/sysinfo

# 运行程序
CMD ["/bin/sh"]
```

在这个示例中，我们使用了两个基础镜像：debian:latest 和 debian:latest。第一个基础镜像用于编译程序，第二个基础镜像用于运行程序。

在第一个阶段中，我们使用 debian:latest 基础镜像来安装编译依赖项。然后，我们将程序的源代码复制到容器内，并将工作目录切换到 /app。最后，我们使用 make 命令来编译程序。

在第二阶段中，我们使用 debian:latest 基础镜像来添加可执行文件。然后，我们指定 /bin/sh 作为运行程序的命令。

# GitHub CICD Pipeline

GitHub Actions 的管理界面 [https://github.com/scaffolding-design/c/actions](https://github.com/scaffolding-design/c/actions) 

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/af432deecd69aea39f06ed939e0441a7.png?qc_blockWidth=657&qc_blockHeight=291)

GitHub Actions 工作流的 YAML 文件 .github/workflows/pipeline.yaml  

pipeline由四个阶段组成：

1. 构建测试：此阶段从源代码构建 sysinfo 库, 并运行测试套件，以确保 sysinfo 库正常工作。
2. Docker 镜像：此阶段构建一个包含 sysinfo 库的 Docker 镜像。
3. 设置 K3s：此阶段在远程服务器上设置 K3s 集群。
4. 部署应用：此阶段将 sysinfo 库部署到 K3s 集群。

触发器：pipeline 由以下事件触发：

- 当打开或更新拉取请求时。
- 当代码推送到主分支时。
- 当工作流程手动调度时。

环境变量：pipeline 使用以下环境变量：

- TZ: 用于时间戳的时区。
- REPO: Onwalk 制品存储库的名称。
- IMAGE: 要构建的 Docker 镜像的名称。
- TAG: 要分配给 Docker 镜像的标签。

如需在自己的账号运行这个Demo，只需要将 [https://github.com/scaffolding-design/c.git](https://github.com/scaffolding-design/c.git) 这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

# 制品下载地址

1. GitHub Release: [https://github.com/scaffolding-design/c/releases/tag/main](https://github.com/scaffolding-design/c/releases/tag/main)
2. 容器镜像仓库  : artifact.onwalk.net/base/scaffolding-design/c:<git\_commit\_id>
其中，<git\_commit\_id> 是 Git 提交 ID。

# 参考

更多细节可以 [https://github.com/scaffolding-design/c.git](https://github.com/scaffolding-design/c.git) 仓库代码。

