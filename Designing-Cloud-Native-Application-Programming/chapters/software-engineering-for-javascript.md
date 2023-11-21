## JavaScript

在 Linux（Ubuntu/Fedora）和 MacOS 下的 JavaScript 开发环境设置步骤：

- Ubuntu/Linux 安装NodeJS，
在终端中，更新系统软件包列表：
sudo apt update
sudo apt install sudo apt installl nodejs  npm -y 
- Fedora/Linux 安装NodeJS
在终端中，更新系统软件包列表：
sudo dnf update
sudo dnf install sudo dnf installl nodejs npm -y 
- MacOS 安装NodeJS：
    - 安装 Homebrew:  /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/](https://raw.githubusercontent.com/Homebrew/). install/HEAD/install.sh)"     
    - 如果因为GFW无法执行，可以手动下载 [https://github.com/Homebrew/install/blob/master/install.sh](https://github.com/Homebrew/install/blob/master/install.sh) 安装脚本执行      
    - 安装后在终端中配置环境变量，安装Rust

```
eval "$(/opt/homebrew/bin/brew shellenv)"       
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile       
source ~/.zprofile
brew install node npm
```

- 配置 NodeJS Vue3 Express 开发环境
    1. 安装 Vue3: npm install vue-cli
    2. 安装 Express: npm install express
- 验证NodeJS Vue3 开发环境
    - 创建简单 Vue 应用程序的快速示例：

```
mkdir -pv my-app && cd my-app
vue create my-app  # 当被问及是否要使用默认配置时，请按“Y”
npm run serve # 运行以下命令来启动应用程序
```

- 验证NodeJS  Express 开发环境
    - 创建一个简单的 Express 应用程序示例：

```
mkdir my-app && cd my-app && npm init -y
npm install express 
cat >  app.js <<EOF
const express = require('express');
const app = express();
app.get('/', (req, res) => {
  res.send('Hello, world!');
});
app.listen(3000);
EOF
node app.js # 运行应用程序
```

使用浏览器打开 http://localhost:3000 来验证应用程序是否正常工作。如果您看到 "Hello, world!" 说明 Node.js 和 Express 开发环境已正确配置

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

# JavaScript 语言项目

## 前端/Vue3 项目

以下是一个 JavaScript 语言 Vue3 项目开发的项目结构参考：

```
frontend
├── src
│   ├── App.vue
│   ├── components
│   │   └── List.vue
│   ├── main.js
│   └── router.js
├── .gitignore
├── Dockerfile
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
- node\_modules 目录是项目的依赖项目录，存放项目的所有依赖项。
- README.md 文件是项目的说明文件，用于描述项目的功能、用法等。

 **前端/Vue3 项目 Dockerfile** 

以下是一个前端/Vue3 项目 Dockerfile 多阶段构建的示例

```Dockerfile
# 构建阶段
FROM node:21.2.0-alpine as builder

WORKDIR /app
COPY package.json .
RUN apk add --no-cache git && npm install --prefer-offline
COPY . .
RUN npm run build

# 运行阶段
FROM nginx:1.21.5-alpine

COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

这个 Dockerfile 使用了两阶段构建：

- 第一阶段：用于编译项目。该阶段使用了 node:21.2.0-alpine  镜像作为基础镜像，并安装了依赖。然后，将项目的源代码复制到镜像中，进行编译。
- 第二阶段：用于运行项目。该阶段使用了 nginx:1.21.5-alpine 镜像作为基础镜像，并复制第一阶段编译的产物到镜像中。然后，配置 nginx 并启动 nginx。

## 后端 NodeJS/Express 项目

后端 NodeJS / Express 项目开发的项目结构参考：

```
frontend
├── app/
│   ├── controllers/
│   │   └── ListController.js
│   ├── models/
│   │   └── List.js
│   └── routes/
│       └── index.js
├── package.json
└── README.md
```

其中：

- app 目录是项目的源码目录，存放项目的所有业务逻辑代码。
- controllers 目录是项目的控制器目录，存放项目的所有 HTTP 控制器。
- models 目录是项目的数据模型目录，存放项目的数据模型。
- routes 目录是项目的路由目录，存放项目的所有路由。
- node\_modules 目录是项目的依赖项目录，存放项目的所有依赖项。
- package.json 文件是项目的包文件，用于指定项目的依赖项。
- README.md 文件是项目的说明文件，用于描述项目的功能、用法等。

**后端 NodeJS / Express 项目 Dockerfile 示例**

以下是一个使用多阶段构建构建后端 NodeJS / Express 项目的 Dockerfile 示例：

```Dockerfile
FROM node:21.2.0-alpine

WORKDIR /app
COPY . .
RUN rm -f Dockerfile && npm install --prefer-offline

EXPOSE 80

CMD ["node", "index.js"]
```

这个 Dockerfile 构建一个 Node.js 应用程序的镜像。该镜像将使用 Alpine Linux 作为基础操作系统，并安装应用程序的依赖项。容器启动时将运行 node index.js 命令来启动应用程序，并公开应用程序的端口 80。

## Github CICD Pipeline

1. GitHub Actions 的管理界面  [https://github.com/scaffolding-design/javascript/actions](https://github.com/scaffolding-design/javascript/actions)

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/a5159771ba8a0089032e48c5baefaf47.png?qc_blockWidth=657&qc_blockHeight=289)

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
- REPO: Onwalk 制品存储库的名称。
- IMAGE: 要构建的 Docker 镜像的名称。
- TAG: 要分配给 Docker 镜像的标签。

如需在自己的账号运行这个Demo，只需要将  [https://github.com/scaffolding-design/javascript.git](https://github.com/scaffolding-design/javascript.git) 这个仓库Fork 到你自己的Github账号下，同时在

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

API 可以在本地通过 http://localhost:80/ 访问。确保服务器正在运行后进行请求。

## API 端点

| 端点 | 方法 | 描述 |
|:----|:----|:----|
| `/list` | **GET** | 获取用户列表 |


## 示例请求

| 端点 | 请求方法 | 请求参数 | 预期输出 |
|:----|:----|:----|:----|
| `/list` | **GET** | **无** | `[{"id": 1, "name": "用户 1"}, {"id": 2, "name": "用户 2"}]` |


## 前端

该 API 的前端代码位于 `frontend` 目录中。`List.vue` 组件负责显示用户列表。

## 后端

该 API 的后端代码位于 `backend` 目录中。`ListController.getList()` 方法负责获取用户列表。

# 制品下载地址

1. GitHub Release: [https://github.com/scaffolding-design/javascript/releases/tag/main](https://github.com/scaffolding-design/javascript/releases/tag/main)
2. 容器镜像仓库  : 
    - artifact.onwalk.net/base/scaffolding-design/javascript-frontend:<git\_commit\_id>
    - artifact.onwalk.net/base/scaffolding-design/javascript-backend:<git\_commit\_id>
