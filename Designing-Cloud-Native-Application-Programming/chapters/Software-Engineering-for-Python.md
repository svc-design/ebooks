# Python

在 Linux（Ubuntu/Fedora）和 MacOS 下的 Python 开发环境设置步骤

- Ubuntu/Linux 安装 Python
在终端中，更新系统软件包列表：sudo apt update
安装 Python：sudo apt install python3  eval "$(/opt/homebrew/bin/brew shellenv)"       
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile       
  source ~/.zprofile
  brew install python在终端中，创建一个简单的 Python 脚本：保存为 main.py
- Fedora/Linux 安装 Python
在终端中，更新系统软件包列表：sudo dnf update 
安装 Python：sudo dnf install python3
- MacOS 安装 Python
    - 安装 Homebrew:  /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/](https://raw.githubusercontent.com/Homebrew/). install/HEAD/install.sh)"     
    - 如果因为GFW无法执行，可以手动下载 [https://github.com/Homebrew/install/blob/master/install.sh](https://github.com/Homebrew/install/blob/master/install.sh) 安装脚本执行      
    - 安装后在终端中配置环境变量，安装Python

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

# 项目代码参考

- Python 语言项目开发的标准参考目录结构如下：

```
myproject/
├── src/
│   └── example_pkg/
│       ├── __init__.py
│       └── core.py
├── tests/
├── test_main.py	
├── test_units.py
├── setup.py
├── Dockerfile
└── README.md
```

其中：

- src 目录是项目的源码目录，存放项目的所有 Python 源代码文件，包括模块、类、函数等。
- src/example\_pkg 是项目的包目录，存放项目的所有包。
- main.py 是项目的核心模块，存放项目的主要逻辑。
- tests 目录是项目的测试目录，存放项目的所有测试用例。
- setup.py 文件是项目的打包文件，用于打包项目为 Python 包。
- README.md 文件是项目的说明文件，用于描述项目的功能、用法等。

具体的目录结构可以根据项目的实际情况进行调整。例如，对于简单的项目，可以将 src 和 tests 目录合并为一个目录。对于大型的项目，可以根据模块的功能划分多个子包。

# Dockerfile

以下是一个 Dockerfile 多阶段构建的示例：

```Dockerfile
#第一阶段：编译阶段
FROM python:3.10-buster AS builder

WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt
RUN python3 -m pip install build && python3 -m build

# 第二阶段：运行阶段
FROM python:3.10-slim-buster

WORKDIR /app
COPY --from=builder /app/main.py .
COPY --from=builder /app/dist/example_pkg-0.1.0.tar.gz /tmp/
RUN pip3 install /tmp/example_pkg-0.1.0.tar.gz && rm -f /tmp/example_pkg-0.1.0.tar.gz
CMD python3 main.py
```

这个 Dockerfile 使用了两阶段构建：

第一阶段：用于编译项目。该阶段使用了 python:3.10-buster 镜像作为基础镜像，并安装了编译依赖。然后，将项目的源代码复制到镜像中，并使用 pip3 进行编译。

第二阶段：用于运行项目。该阶段使用了 python:3.10-slim-buster 镜像作为基础镜像，并安装了运行依赖。然后，将第一阶段编译的产物复制到镜像中，并启动项目。

使用多阶段构建，可以将编译依赖和运行依赖分离，从而减少镜像的大小和体积。

# Github CICD Pipeline

 GitHub Actions 的管理界面 [https://github.com/scaffolding-design/python/actions](https://github.com/scaffolding-design/python/actions)

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/bf5065d8d2bf53267c175bf8ef5e8dc2.png?qc_blockWidth=657&qc_blockHeight=291)

流水线配置文件位于 Python.git 仓库中 .github/workflows/pipeline.yaml 由四个阶段组成：

1. 构建测试：此阶段从源代码构建 sysinfo 库, 并运行测试套件，以确保 sysinfo 库正常工作。
2. Docker 镜像：此阶段构建一个包含 sysinfo 库的 Docker 镜像。
3. 设置 K3s：此阶段在远程服务器上设置 K3s 集群。
4. 部署应用：此阶段将 sysinfo 库部署到 K3s 集群。
5. 触发器, 管道由以下事件触发：
6. 当打开或更新拉取请求时。
7. 当代码推送到主分支时。
8. 当工作流程手动调度时。
9. 环境变量, 管道使用以下环境变量：
10. TZ: 用于时间戳的时区。
11. REPO: Onwalk 制品存储库的名称。
12. IMAGE: 要构建的 Docker 镜像的名称。
13. TAG: 要分配给 Docker 镜像的标签。

如需在自己的账号运行这个Demo，只需要将 [https://github.com/scaffolding-design/python.git](https://github.com/scaffolding-design/python.git) 这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的变量:

- HELM\_REPO\_USER             Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名         
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥

一起就绪后，就可以看到 DevOPS 实践/GitHub Actions CICD 一节所示，在这个工作流中，自动的完成C程序的编译，测试，打包容器镜像并推送到自定义的仓库，并完成K3S集群的初始化，将容器镜像部署到K3S集群中。

## 端点API

API 可以在本地通过 http://localhost:80/ 访问。确保服务器正在运行后进行请求。

- 端点：/
    - 方法： GET
    - 描述： 返回问候消息。
    - 示例请求：curl http://localhost:80/
    - 预期输出：{"message": "Hello, world!"}
- 端点：/user
    - 方法： POST
    - 描述： 根据提供的 JSON 负载创建用户。
    - 示例请求：curl -X POST -H "Content-Type: application/json" -d '{"username": "Bard", "age": 20}' http://localhost:80/user
    - 预期输出：{"username": "Bard", "age": 20}

# 制品下载地址

1. GitHub Release: [https://github.com/scaffolding-design/python/releases/tag/main](https://github.com/scaffolding-design/python/releases/tag/main)
2. 容器镜像仓库  : artifact.onwalk.net/base/scaffolding-design/python:<git\_commit\_id>
