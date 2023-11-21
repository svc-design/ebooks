# Rust 语言

在 Linux（Ubuntu/Fedora）和 MacOS 下的Rust 开发环境设置步骤：

- Ubuntu/Linux 安装Rust，在终端中，更新系统软件包列表：
安装 Rust: curl [https://sh.rustup.rs](https://sh.rustup.rs) -sSf | sh
验证 Rust 安装是否成功： rustc --version
- Fedora/Linux 安装Rust，在终端中，更新系统软件包列表：
安装 EPEL 软件源。 sudo yum install epel-release
安装 Rust: curl [https://sh.rustup.rs](https://sh.rustup.rs) -sSf | sh
验证 Rust 安装是否成功: rustc --version
- MacOS 安装NodeJS：
    - 安装 Homebrew:  /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/](https://raw.githubusercontent.com/Homebrew/). install/HEAD/install.sh)"     
    - 如果因为GFW无法执行，可以手动下载 [https://github.com/Homebrew/install/blob/master/install.sh](https://github.com/Homebrew/install/blob/master/install.sh) 安装脚本执行      
    - 安装后在终端中配置环境变量，安装Rust

```
eval "$(/opt/homebrew/bin/brew shellenv)"       
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile       
source ~/.zprofile
brew install rust
```

- 验证 Rust 开发环境：
    - cargo new my-project
    - 在 src/main.rs 文件中，添加以下代码：

```
fn main() {
    println!("Hello, world!");
}
```

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

# 项目目录参考

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

# 多阶段构建 Dockerfile 的示例

Rust语言 项目的 Dockerfile 多阶段构建示例如下：

```Dockerfile
# 第一个阶段：构建 Rust 二进制文件
FROM rust:1.72.1-slim-buster as builder

WORKDIR /app
COPY . .
RUN cargo build --release

# 第二个阶段：将 Rust 二进制文件复制到最终镜像
FROM scratch
COPY --from=builder /app/target/release/my_rust_server /app
CMD ["/app/my_rust_server"]
```

请谨慎使用代码。了解详情

该 Dockerfile 使用两阶段构建：

- 第一阶段使用 Rust 官方镜像进行 Rust 编译，将编译后的可执行文件复制到 /app 目录。
- 第二阶段使用一个空镜像，从第一阶段复制可执行文件，并将其设置为容器的启动命令。

# Github CICD Pipeline

GitHub Actions 的管理界面 [https://github.com/scaffolding-design/rust/actions](https://github.com/scaffolding-design/rust/actions)

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/516565ef50bec6b7f355e7d51d403c1a.png?qc_blockWidth=657&qc_blockHeight=290)

## 流水线配置文件

流水线配置文件位于 .github/workflows/pipeline.yaml 由四个阶段组成：

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
- REPO: Onwalk 制品存储库的名称。
- IMAGE: 要构建的 Docker 镜像的名称。
- TAG: 要分配给 Docker 镜像的标签。

如需在自己的账号运行这个Demo，只需要将 [https://github.com/scaffolding-design/rust.git](https://github.com/scaffolding-design/rust.git) 这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一切就绪后，就可以看到。在这个CI工作流中，自动的完成程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

# API 参考

API 可以在本地通过 http://localhost:80/ 访问。确保服务器正在运行后进行请求。

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

1. GitHub Release: [https://github.com/scaffolding-design/rust/releases/tag/main](https://github.com/scaffolding-design/rust/releases/tag/main)
2. 容器镜像仓库  : artifact.onwalk.net/base/scaffolding-design/rust:<git\_commit\_id>
