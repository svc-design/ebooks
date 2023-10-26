# 开发环境

Vue3、Rust、Go、Python、Nodejs 在 Linux（Ubuntu/CentOS）和 MacOS 下的开发环境设置步骤：

## Vue3
* Linux（Ubuntu）
安装 Nodejs。
sudo apt install nodejs
安装 NPM。
sudo apt install npm
安装 Vue CLI。
npm install -g @vue/cli
创建一个 Vue3 项目。
vue create my-project
进入项目目录。
cd my-project
启动项目。
npm run serve

* Linux（CentOS）
安装 EPEL 软件源。sudo yum install epel-release
安装 Nodejs sudo yum install nodejs
安装 NPM。sudo yum install npm
安装 Vue CLI。npm install -g @vue/cli
创建一个 Vue3 项目。
vue create my-project
进入项目目录。
cd my-project
启动项目。
npm run serve

* MacOS

安装 Homebrew。
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
使用 Homebrew 安装 Nodejs: brew install node
使用 Homebrew 安装 NPM: brew install npm
安装 Vue CLI: npm install -g @vue/cli
创建一个 Vue3 项目。
vue create my-project
进入项目目录。
cd my-project
启动项目。
npm run serve

## Rust

* Linux（Ubuntu）
安装 Rust: curl https://sh.rustup.rs -sSf | sh
验证 Rust 安装是否成功。
rustc --version
* Linux（CentOS）
安装 EPEL 软件源。 sudo yum install epel-release
安装 Rust: curl https://sh.rustup.rs -sSf | sh
验证 Rust 安装是否成功: rustc --version
* MacOS
安装 Homebrew: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
使用 Homebrew 安装 Rust: brew install rust
验证 Rust 安装是否成功: rustc --version

## Go
* Linux（Ubuntu）
安装 Go: sudo apt install golang
验证 Go 安装是否成功 go version
* Linux（CentOS）
安装 EPEL 软件源。
sudo yum install epel-release
安装 Go: sudo yum install golang
验证 Go 安装是否成功 go version

* MacOS
安装 Homebrew。
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
使用 Homebrew 安装 Go。
brew install go
验证 Go 安装是否成功。
go version
Python
Linux（Ubuntu）
安装 Python。
sudo apt install python3

Python 开发环境设置步骤

Linux（Ubuntu）
安装 Python。
sudo apt install python3
验证 Python 安装是否成功。
python3 --version
安装 Pip3。
sudo apt install python3-pip
验证 Pip3 安装是否成功。
pip3 --version
安装你需要的 Python 库。
pip3 install my-library
Linux（CentOS）
安装 EPEL 软件源。
sudo yum install epel-release
安装 Python。
sudo yum install python3
验证 Python 安装是否成功。
python3 --version
安装 Pip3。
sudo yum install python3-pip
验证 Pip3 安装是否成功。
pip3 --version
安装你需要的 Python 库。
pip3 install my-library
MacOS
安装 Homebrew。
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
使用 Homebrew 安装 Python。
brew install python
验证 Python 安装是否成功。
python --version
安装 Pip3。
brew install pip3
验证 Pip3 安装是否成功。
pip3 --version
安装你需要的 Python 库。
pip3 install my-library
Nodejs 开发环境设置步骤

Linux（Ubuntu）
安装 Nodejs。
sudo apt install nodejs
安装 NPM。
sudo apt install npm
验证 Nodejs 和 NPM 安装是否成功。
node -v
npm -v
Linux（CentOS）
安装 EPEL 软件源。
sudo yum install epel-release
安装 Nodejs。
sudo yum install nodejs
安装 NPM。
sudo yum install npm
验证 Nodejs 和 NPM 安装是否成功。
node -v
npm -v
MacOS
安装 Homebrew。
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
使用 Homebrew 安装 Nodejs。
brew install node
使用 Homebrew 安装 NPM。
brew install npm
验证 Nodejs 和 NPM 安装是否成功。
node -v
npm -v
注意事项

在 Linux 上，你需要使用 root 用户权限才能安装软件包。如果不想使用 root 用户权限，可以使用 sudo 命令。
在 MacOS 上，你需要使用 brew 命令来安装软件包。
额外资源

Python 官方文档: https://docs.python.org/3/
Nodejs 官方文档: https://nodejs.org/en/docs/


vue3

brew install node
npm install @vue/cli

npm init vite@latest
按提示进行操作，然后打开项目
npm install
npm run dev

npm i axios
npm install vue-router@4

npm install pinia

npm init @vitejs/app
npm install @vue/cli-plugin-weex
vue-cli-service build --target=weapp


原生开发工具：

HBuilderX
Android Studio：用于开发 Android 应用。
Xcode：用于开发 iOS 应用。
Weex Studio：用于开发基于 Vue3 的 Web 应用和原生应用。

