# Go

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
安装 Homebrew：
    - 安装 Homebrew:  /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/](https://raw.githubusercontent.com/Homebrew/). install/HEAD/install.sh)"     
    - 如果因为GFW无法执行，可以手动下载 [https://github.com/Homebrew/install/blob/master/install.sh](https://github.com/Homebrew/install/blob/master/install.sh) 安装脚本执行      
    - 安装后在终端中配置环境变量，安装Go

```
eval "$(/opt/homebrew/bin/brew shellenv)"       
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile       
source ~/.zprofile
brew install go
```

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

# 项目目录参考

```
example_pkg
|-- go.mod
|-- main.go
|-- internal
|   |-- api              
|   |   |-- api.go
|   |-- pkg
|       |-- functions.go
|-- tests
|   |-- http_test.go
```

在这个示例中，项目的Go目录包含以下文件：

- go.mod：项目的模块文件，用于指定项目的依赖关系。
- go.sum：项目的依赖关系的哈希值，用于验证依赖库的版本。
- main.go：项目的主入口文件。
- internal/api/server.go：项目的 API 实现文件。
- internal/api/functions.go ：项目的用于处理查询和插入的公共函数
- tests/http\_test.go：单元测试代码

具体的目录结构可以根据项目的需要进行调整

# Dockerfile示例

以下是一个 GO 语言项目 Dockerfile 多阶段构建的示例：

```Dockerfile
#第一阶段：编译阶段
FROM golang:1.21-alpine as builder

WORKDIR /app
COPY . .
RUN go build -o main

# 第二阶段：运行阶段
FROM alpine:3.15 as runner

WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 80
CMD ["./main"]
```

这个 Dockerfile 分为两个阶段：

- 第一阶段：使用 golang:1.21-alpine 镜像作为基础镜像，编译 Go 应用程序。
- 第二阶段：使用 alpine:3.15 镜像作为基础镜像，复制编译好的 Go 应用程序，并设置工作目录和运行命令。

# Github CICD Pipeline

 GitHub Actions 的管理界面 [https://github.com/scaffolding-design/go/actions](https://github.com/scaffolding-design/go/actions)

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/5acd9650ef1c2b62a93eb497c1c9c600.png?qc_blockWidth=657&qc_blockHeight=287)

## 流水线配置文件

配置文件位于 .github/workflows/pipeline.yaml 由四个阶段组成：

1. 构建测试：此阶段从源代码构建 APP, 并运行测试套件，以确保APP 正常工作。
2. Docker 镜像：此阶段构建一个包含 APP 的 Docker 镜像。
3. 设置 K3s：此阶段在远程服务器上设置 K3s 集群。
4. 部署应用：此阶段将 APP 部署到 K3s 集群。

## 触发器

管道由以下事件触发：

- 当打开或更新拉取请求时。
- 当代码推送到主分支时。
- 当工作流程手动调度时。

## 环境变量

管道使用以下环境变量：

- TZ: 用于时间戳的时区。
- REPO: 制品存储库的名称。
- IMAGE: 要构建的 Docker 镜像的名称。
- TAG: 要分配给 Docker 镜像的标签。

如需在自己的账号运行这个Demo，只需要将[https://github.com/SvcDesignScaffolding/Go.git](https://github.com/SvcDesignScaffolding/Go.git) 这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

# API 参考

API 可以在本地通过 http://localhost:8080/ 访问。确保服务器正在运行后进行请求。

## 端点

| 端点 | 方法 | 描述 |
|:----|:----|:----|
| / | GET | 返回问候消息 |
| /api/query | GET | 返回查询成功消息 |
| /api/insert | POST | 返回插入成功消息 |


## 示例请求

| 端点 | 请求方法 | 请求参数 | 预期输出 |
|:----|:----|:----|:----|
| / | GET | 无 | {"message": "Hello, world!"} |
| /api/query | GET | 无 | {"message": "查询成功"} |
| /api/insert | POST | 无 | {"message": "插入成功"} |


# 制品下载地址

1. GitHub Release: [https://github.com/scaffolding-design/go/releases/tag/main](https://github.com/scaffolding-design/go/releases/tag/main)
2. 容器镜像仓库  : artifact.onwalk.net/base/scaffolding-design/go:<git\_commit\_id>
